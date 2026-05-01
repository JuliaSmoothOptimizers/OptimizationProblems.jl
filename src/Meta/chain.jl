chain_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 77,
  :variable_ncon => true,
  :minimize => true,
  :name => "chain",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/CHAIN.SIF",
  :notes => raw"""
Hanging Chain

Find the chain (of uniform density) of length L suspended between two points with minimal
potential energy.

This is problem 4 in the COPS (Version 3) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)

classification OOR2-AN-V-V
""",
  :origin_notes => raw"""
Problem :
Find the chain (of uniform density) of length L suspended between
two points with minimal potential energy
This is problem 3 in the COPS (Version 2) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2000)
SIF input: Nick Gould, November 2000
classification OOR2-AN-V-V
""",
  :reference => raw"""
@techreport{DolanMore2004COPS,
  author       = {Dolan, Elizabeth D. and Mor{'e}, Jorge J.},
  title        = {Benchmarking Optimization Software with {COPS} 3.0},
  institution  = {Argonne National Laboratory},
  number       = {ANL/MCS-TM-273},
    year         = {2004},
  doi          = {10.2172/834714}
  }
    """,

  :lib => "CUTEst:CHAIN, COPS:4",
)
get_chain_nvar(; n::Integer = default_nvar, kwargs...) = 4 * (max(2, div(n - 4, 4)) + 1)
get_chain_ncon(; n::Integer = default_nvar, kwargs...) = 3 * max(2, div(n - 4, 4)) + 5
get_chain_nlin(; n::Integer = default_nvar, kwargs...) = max(2, div(n - 4, 4)) + 5
get_chain_nnln(; n::Integer = default_nvar, kwargs...) = 2 * max(2, div(n - 4, 4))
get_chain_nequ(; n::Integer = default_nvar, kwargs...) = 3 * max(2, div(n - 4, 4)) + 5
get_chain_nineq(; n::Integer = default_nvar, kwargs...) = 0
