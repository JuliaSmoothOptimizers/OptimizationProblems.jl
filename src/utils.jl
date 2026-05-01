"""
    export_bibtex(filename = "OptimizationProblems.bib")

Write all non-empty `:reference` BibTeX entries from `OptimizationProblems.meta`
to `filename`. Entries are deduplicated by their BibTeX key, so problems sharing
the same reference only appear once.
"""
function export_bibtex(filename = "OptimizationProblems.bib")
  seen_keys = Set{String}()
  count = 0
  open(filename, "w") do io
    for row in eachrow(OptimizationProblems.meta)
      ref = strip(row[:reference])
      isempty(ref) && continue
      # Extract the BibTeX citation key (first token after @type{)
      m = match(r"@\w+\s*[{(]\s*([^,\s]+)\s*,"s, ref)
      key = isnothing(m) ? ref : m.captures[1]
      key in seen_keys && continue
      push!(seen_keys, key)
      println(io, ref)
      println(io)
      count += 1
    end
  end
  @info "Exported $count BibTeX entries to $filename"
end
