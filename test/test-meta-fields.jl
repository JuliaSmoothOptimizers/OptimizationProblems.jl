"""
    is_valid_url(s) -> Bool

Return `true` if every comma-separated part of `s` is a syntactically valid
HTTP or HTTPS URL.  A single URL (no commas) is the common case.
No network request is made; only the structure of each part is checked.
"""
function is_valid_url(s::String)
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
    (row[:name], row[:url]) for row in eachrow(OptimizationProblems.meta) if
    !isempty(row[:url]) && !is_valid_url(row[:url])
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
