methanol_meta = Dict(
  :nvar => 3005,
  :variable_nvar => true,
  :ncon => 3000,
  :variable_ncon => true,
  :minimize => true,
  :name => "methanol",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/METHANOL.SIF",
  :notes => raw"""
 Methanol-to-Hydrocarbons Problem
 Collocation formulation
 Michael Merritt - Summer 2000
 COPS 2.0 - September 2000
 COPS 3.0 - November 2002
 COPS 3.1 - March 2004
  """,
  :origin_notes => raw"""
Problem :
Determine the reaction coefficients for the conversion of methanol into
various hydrocarbons. The nonlinear model that describes the process is
y_1' = - (2 theta_2 + theta_3 + theta_4 - theta_1 y_2 / d ) y_1
y_2' = theta_3 y_1 + theta_1 y_1 ( theta_1 y_1 - y_2 ) / d
y_3' = theta_4 y_1 + theta_1 y_1 ( theta_5 y_1 + y_2 ) / d
where d = (theta_2 + theta_5) y_1 + y_2 and the theta_i are positive,
with given initial conditions. The problem is to minimize
sum{i=1,16} || y(tau_i,theta) - z_i||^2
where the z_i are concentration measurements for y at times tau_i (i=1,16)
This is problem 13 in the COPS (Version 2) collection of 
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

  :lib => "CUTEst:METHANOL",
)
get_methanol_nvar(; n::Integer = default_nvar, kwargs...) = 30 * n + 5
get_methanol_ncon(; n::Integer = default_nvar, kwargs...) = 30 * n + 0
get_methanol_nlin(; n::Integer = default_nvar, kwargs...) = 21 * n + 0
get_methanol_nnln(; n::Integer = default_nvar, kwargs...) = 9 * n + 0
get_methanol_nequ(; n::Integer = default_nvar, kwargs...) = 30 * n + 0
get_methanol_nineq(; n::Integer = default_nvar, kwargs...) = 0
