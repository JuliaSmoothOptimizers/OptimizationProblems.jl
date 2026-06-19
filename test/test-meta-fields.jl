"""
    is_valid_urls(s) -> Bool

Return `true` if every comma-separated part of `s` is a syntactically valid
HTTP or HTTPS URL.  A single URL (no commas) is the common case.
No network request is made; only the structure of each part is checked.
"""
function is_valid_urls(s::String)
  parts = strip.(split(s, ","))
  return all(p -> match(r"^https?://[^\s/$.?#][^\s]*$"i, p) !== nothing, parts)
end

"""
    is_valid_bibtex(s) -> Bool

Return `true` if `s` looks like a structurally valid BibTeX entry, i.e.:
- Starts with `@entrytype{key,` (or parentheses variant).
- Has balanced curly braces.
"""
function is_valid_bibtex(s::String)
  s = strip(s)
  isempty(s) && return false
  # Must match @entrytype{key, or @entrytype(key,
  match(r"^@\w+\s*[{(]\s*[^,\s]+\s*,"s, s) === nothing && return false
  # Braces must be balanced
  depth = 0
  for c in s
    if c == '{'
      depth += 1
    elseif c == '}'
      depth -= 1
      depth < 0 && return false
    end
  end
  return depth == 0
end

@testset "Meta fields: :url format" begin
  invalid = [
    (row[:name], row[:url]) for
    row in eachrow(OptimizationProblems.meta) if !isempty(row[:url]) && !is_valid_urls(row[:url])
  ]
  for (name, url) in invalid
    @error "Problem $name has an invalid :url format: $url"
  end
  @test isempty(invalid)
end

@testset "Meta fields: :reference BibTeX structure" begin
  invalid = [
    row[:name] for row in eachrow(OptimizationProblems.meta) if
    !isempty(strip(row[:reference])) && !is_valid_bibtex(row[:reference])
  ]
  for name in invalid
    @error "Problem $name has an invalid BibTeX entry in :reference"
  end
  @test isempty(invalid)
end

@testset "Meta fields: :implementation values and consistency" begin
  valid_impl = (:both, :jump, :adnlpmodels)

  invalid_value = [
    row[:name] for row in eachrow(OptimizationProblems.meta)
    if row[:implementation] ∉ valid_impl
  ]
  for name in invalid_value
    @error "Problem $name has invalid :implementation value: $(OptimizationProblems.meta[OptimizationProblems.meta.name .== name, :implementation][1])"
  end
  @test isempty(invalid_value)

  for row in eachrow(OptimizationProblems.meta)
    prob = Symbol(row[:name])
    impl = row[:implementation]
    in_adnlp = isdefined(ADNLPProblems, prob)
    in_jump = isdefined(PureJuMP, prob)
    if impl == :both
      @test in_adnlp && in_jump
    elseif impl == :jump
      @test !in_adnlp && in_jump
    elseif impl == :adnlpmodels
      @test in_adnlp && !in_jump
    end
  end
end

@testset "Meta fields: :lib format" begin
  invalid = Tuple{String, String, String}[]
  for row in eachrow(OptimizationProblems.meta)
    isempty(row[:lib]) && continue
    for entry in split(row[:lib], ",")
      e = strip(entry)
      m = match(r"^(\w+):\S+$", e)
      if m === nothing
        push!(invalid, (row[:name], e, "bad format (expected 'Collection:ID')"))
      elseif !haskey(OptimizationProblems.LIB_REFERENCES, m.captures[1])
        push!(invalid, (row[:name], e, "unknown collection '$(m.captures[1])'"))
      end
    end
  end
  for (name, entry, reason) in invalid
    @error "Problem $name has invalid :lib entry '$entry': $reason"
  end
  @test isempty(invalid)
end
