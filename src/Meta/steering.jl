steering_meta = Dict(
  :nvar => 506,
  :variable_nvar => true,
  :ncon => 408,
  :variable_ncon => true,
  :minimize => true,
  :name => "steering",
  :has_equalities_only => false,
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
  :url => "https://bitbucket.org/optrove/sif/src/master/STEERING.SIF",
  :notes => raw"""
Rocket Steering Problem

 Minimize the time taken for a particle, acted upon by a thrust of     
constant magnitude, to achieve a given altitude and terminal velocity

 Trapezoidal formulation

classification LOR2-AN-V-V
""",
  :origin_notes => raw"""
This is problem 9 in the COPS (Version 2) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2000)

COPS 2.0 - September 2000
COPS 3.0 - November 2002
COPS 3.1 - March 2004

SIF input: Nick Gould, December 2000
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
  :lib => "CUTEst:STEERING, COPS:9",
)
get_steering_nvar(; n::Integer = default_nvar, kwargs...) = 5 * n + 6
get_steering_ncon(; n::Integer = default_nvar, kwargs...) = 4 * n + 8
get_steering_nlin(; n::Integer = default_nvar, kwargs...) = 8
get_steering_nnln(; n::Integer = default_nvar, kwargs...) = 4 * n + 0
get_steering_nequ(; n::Integer = default_nvar, kwargs...) = 4 * n + 7
get_steering_nineq(; n::Integer = default_nvar, kwargs...) = 1
