"""
    LIB_REFERENCES

Canonical BibTeX entries for the external test-set collections referenced in the
`:lib` field of `OptimizationProblems.meta`.  Keys are the collection names used
in `:lib` (e.g. `"CUTEst"`, `"HS"`).

See also [`export_bibtex`](@ref).
"""
const LIB_REFERENCES = Dict(
  "CUTEst" => raw"""
@article{Gould2015CUTEst,
  author  = {Gould, N. I. M. and Orban, D. and Toint, Ph. L.},
  title   = {{CUTEst}: a Constrained and Unconstrained Testing Environment with safe threads for mathematical optimization},
  journal = {Computational Optimization and Applications},
  year    = {2015},
  volume  = {60},
  number  = {3},
  pages   = {545--557},
  doi     = {10.1007/s10589-014-9687-3}
}
""",
  "HS" => raw"""
@book{HockSchittkowski1981,
  author    = {Hock, W. and Schittkowski, K.},
  title     = {Test Examples for Nonlinear Programming Codes},
  series    = {Lecture Notes in Economics and Mathematical Systems},
  volume    = {187},
  publisher = {Springer-Verlag},
  address   = {Heidelberg},
  year      = {1981}
}
""",
  "HS2" => raw"""
@book{Schittkowski1987,
  author    = {Schittkowski, Klaus},
  title     = {More Test Examples for Nonlinear Programming Codes},
  series    = {Lecture Notes in Economics and Mathematical Systems},
  volume    = {282},
  publisher = {Springer-Verlag},
  address   = {Heidelberg},
  year      = {1987},
  doi       = {10.1007/978-3-642-61582-5}
}
""",
  "COPS" => raw"""
@techreport{DolanMore2004COPS,
  author      = {Dolan, Elizabeth D. and Mor{\'e}, Jorge J.},
  title       = {Benchmarking Optimization Software with {COPS} 3.0},
  institution = {Argonne National Laboratory},
  number      = {ANL/MCS-TM-273},
  year        = {2004},
  doi         = {10.2172/834714}
}
""",
  "MGH" => raw"""
@article{MoreGarbowHillstrom1981,
  author  = {Mor{\'e}, Jorge J. and Garbow, Burton S. and Hillstrom, Kenneth E.},
  title   = {Testing Unconstrained Optimization Software},
  journal = {ACM Transactions on Mathematical Software},
  year    = {1981},
  volume  = {7},
  number  = {1},
  pages   = {17--41},
  doi     = {10.1145/355934.355936}
}
""",
  "AMPGO" => raw"""
@misc{GavanaGOTestSuite,
  author       = {Gavana, Andrea},
  title        = {Global Optimization Benchmarks},
  year         = {2013},
  howpublished = {\url{http://infinity77.net/global_optimization/}},
  note         = {Collection of benchmark functions and algorithm comparisons for global optimization (including AMPGO)}
}
""",
  "Luksan" => raw"""
@techreport{LuksanMatonohaVlcek2003,
  author      = {Luksan, Ladislav and Matonoha, Cestmir and Vlcek, Jan},
  title       = {Modified {CUTE} Problems for Sparse Unconstrained Optimization},
  institution = {Institute of Computer Science, Academy of Sciences of the Czech Republic},
  number      = {1081},
  year        = {2003},
  address     = {Prague, Czech Republic}
}
""",
  "NIST" => raw"""
@misc{NIST_StRD,
  author       = {{Statistical Engineering Division, NIST}},
  title        = {Statistical Reference Datasets for Nonlinear Least Squares Regression},
  howpublished = {\url{https://www.itl.nist.gov/div898/strd/nls/nls_main.shtml}},
  year         = {2000}
}
""",
  "LuksanSparse" => raw"""
@techreport{LuksanMatonohaVlcek2010_sparse,
  author      = {Luksan, Ladislav and Matonoha, Ctirad and Vlcek, Jan},
  title       = {Sparse Test Problems for Unconstrained Optimization},
  institution = {Institute of Computer Science, Academy of Sciences of the Czech Republic},
  number      = {V-1064},
  year        = {2010},
  address     = {Prague, Czech Republic},
  url         = {https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization}
}
""",
)

export LIB_REFERENCES

"""
    export_bibtex(filename = "OptimizationProblems.bib"; include_lib_refs = true)

Write all non-empty `:reference` BibTeX entries from `OptimizationProblems.meta`
to `filename`. Entries are deduplicated by their BibTeX key, so problems sharing
the same reference only appear once.

If `include_lib_refs` is `true` (the default), one BibTeX entry per test-set
collection referenced in the `:lib` field is also appended.
"""
function export_bibtex(filename = "OptimizationProblems.bib"; include_lib_refs::Bool = true)
  seen_keys = Set{String}()
  count = 0
  open(filename, "w") do io
    # Per-problem references (from :reference field)
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
    # One BibTeX entry per test-set collection that appears in any :lib value.
    if include_lib_refs
      collections = Set{String}()
      for row in eachrow(OptimizationProblems.meta)
        for entry in split(row[:lib], ",")
          coll = strip(split(strip(entry), ":")[1])
          isempty(coll) || push!(collections, coll)
        end
      end
      for coll in sort(collect(collections))
        haskey(LIB_REFERENCES, coll) || continue
        ref = strip(LIB_REFERENCES[coll])
        m = match(r"@\w+\s*[{(]\s*([^,\s]+)\s*,"s, ref)
        key = isnothing(m) ? ref : m.captures[1]
        key in seen_keys && continue
        push!(seen_keys, key)
        println(io, ref)
        println(io)
        count += 1
      end
    end
  end
  @info "Exported $count BibTeX entries to $filename"
end
