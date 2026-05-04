glider_meta = Dict(
  :nvar => 506,
  :variable_nvar => true,
  :ncon => 407,
  :variable_ncon => true,
  :minimize => false,
  :name => "glider",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/GLIDER.SIF",
  :notes => raw"""
Hang Glider Problem
Trapezoidal formulation

Maximize the final horizontal position of a hang glider in the presence
of a thermal updraft.
""",
  :origin_notes => raw"""
This is problem 11 in the COPS (Version 2) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2000)

David Bortz - Summer 1998
COPS 2.0 - September 2000
COPS 3.0 - November 2002
COPS 3.1 - March 2004  

SIF input: Nick Gould, December 2000
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

  :lib => "CUTEst:GLIDER, COPS:11",
)
get_glider_nvar(; n::Integer = default_nvar, kwargs...) = 5 * n + 6
get_glider_ncon(; n::Integer = default_nvar, kwargs...) = 4 * n + 7
get_glider_nlin(; n::Integer = default_nvar, kwargs...) = 7
get_glider_nnln(; n::Integer = default_nvar, kwargs...) = 4 * n + 0
get_glider_nequ(; n::Integer = default_nvar, kwargs...) = 4 * n + 7
get_glider_nineq(; n::Integer = default_nvar, kwargs...) = 0
