rocket_meta = Dict(
  :nvar => 405,
  :variable_nvar => true,
  :ncon => 304,
  :variable_ncon => true,
  :minimize => false,
  :name => "rocket",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/ROCKET.SIF",
  :notes => raw"""
Goddard Rocket Problem
Trapezoidal formulation

Maximize the final altitude of a vertically-lauched rocket, using
the thrust as a control and given the initial mass, the fuel mass
and the drag characteristics of the rocket.

classification OOR2-AN-V-V
""",
  :origin_notes => raw"""
This is problem 10 in the COPS (Version 2) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2000)

COPS 2.0 - September 2000
COPS 3.0 - November 2002
COPS 3.1 - March 2004

SIF input: Nick Gould, November 2000
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
  :lib => "CUTEst:ROCKET, COPS:10",
)
get_rocket_nvar(; n::Int = default_nvar, kwargs...) = 4 * n + 5
get_rocket_ncon(; n::Int = default_nvar, kwargs...) = 3 * n + 4
get_rocket_nlin(; n::Int = default_nvar, kwargs...) = 4
get_rocket_nnln(; n::Int = default_nvar, kwargs...) = 3 * n + 0
get_rocket_nequ(; n::Int = default_nvar, kwargs...) = 3 * n + 4
get_rocket_nineq(; n::Int = default_nvar, kwargs...) = 0
