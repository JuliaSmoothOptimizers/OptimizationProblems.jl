catmix_meta = Dict(
  :nvar => 2302,
  :variable_nvar => true,
  :ncon => 2002,
  :variable_ncon => true,
  :minimize => true,
  :name => "catmix",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/CATMIX.SIF",
  :notes => raw"""
Catalyst Mixing Problem
Collocation formulation

Determine the optimal mixing policy of two catalysts along the
length of a tubular plug flow reactor involving several reactions

classification OOR2-AN-V-V
""",
  :origin_notes => raw"""
This is problem 14 in the COPS (Version 2) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2000)

COPS 3.0 - November 2002
COPS 3.1 - March 2004

SIF input: Nick Gould, November 2000
""",
  :reference => raw"""
@techreport{DolanMore2004COPS,
  author       = {Dolan, Elizabeth D. and Mor{\'e}, Jorge J.},
  title        = {Benchmarking Optimization Software with {COPS} 3.0},
  institution  = {Argonne National Laboratory},
  number       = {ANL/MCS-TM-273},
  year         = {2004},
  doi          = {10.2172/834714}
}  
  """,
  :lib => "CUTEst:CATMIX, COPS:14",
)
get_catmix_nvar(; n::Integer = default_nvar, kwargs...) = 23 * n + 2
get_catmix_ncon(; n::Integer = default_nvar, kwargs...) = 20 * n + 2
get_catmix_nlin(; n::Integer = default_nvar, kwargs...) = 14 * n + 2
get_catmix_nnln(; n::Integer = default_nvar, kwargs...) = 6 * n + 0
get_catmix_nequ(; n::Integer = default_nvar, kwargs...) = 20 * n + 2
get_catmix_nineq(; n::Integer = default_nvar, kwargs...) = 0
