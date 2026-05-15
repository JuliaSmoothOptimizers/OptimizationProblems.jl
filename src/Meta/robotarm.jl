robotarm_meta = Dict(
  :nvar => 109,
  :variable_nvar => true,
  :ncon => 102,
  :variable_ncon => true,
  :minimize => true,
  :name => "robotarm",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/ROBOTARM.SIF",
  :notes => raw"""
Minimize the time taken for a robot arm to travel between two points.

classification OOR2-AN-V-V
""",
  :origin_notes => raw"""
This is problem 8 in the COPS (Version 3) collection of 
E. Dolan and J. More
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)
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

  :lib => "CUTEst:ROBOTARM, COPS:8",
)
get_robotarm_nvar(; n::Integer = default_nvar, kwargs...) = 9 * (max(2, div(n, 9)) + 1) + 1
get_robotarm_ncon(; n::Integer = default_nvar, kwargs...) =
  3 * (max(2, div(n, 9)) + 1) + 6 * max(2, div(n, 9))
get_robotarm_nlin(; n::Integer = default_nvar, kwargs...) = max(2, div(n, 9)) + 1
get_robotarm_nnln(; n::Integer = default_nvar, kwargs...) =
  2 * (max(2, div(n, 9)) + 1) + 6 * max(2, div(n, 9))
get_robotarm_nequ(; n::Integer = default_nvar, kwargs...) = 6 * max(2, div(n, 9))
get_robotarm_nineq(; n::Integer = default_nvar, kwargs...) = 3 * (max(2, div(n, 9)) + 1)
