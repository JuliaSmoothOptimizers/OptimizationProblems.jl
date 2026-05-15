pinene_meta = Dict(
  :nvar => 5005,
  :variable_nvar => true,
  :ncon => 5000,
  :variable_ncon => true,
  :minimize => true,
  :name => "pinene",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/PINENE.SIF",
  :notes => raw"""
Isomerization of Alpha-Pinene Problem
Collocation formulation

Determine the reaction coefficients in the thermal isometrization 
of alpha-Pinene. The linear kinetic model is
y_1' = - (theta_1 + theta_2) y_1
y_2' = theta_1 y_1
y_3' = theta_2 y_1 - ( theta_3 + theta_4 ) y_3 + theta_5 y_5
y_4' = theta_3 y_3
y_5' = theta_4 y_3 - theta_5 y_5
where the reaction coefficients theta_i are positive,
with given initial conditions. The problem is to minimize
sum{i=1,8} || y(tau_i,theta) - z_i||^2
where the z_i are concentration measurements for y at times tau_i (i=1,8)

classification OOR2-AN-V-V
""",
  :origin_notes => raw"""
This is problem 5 in the COPS (Version 3) collection of
E. Dolan and J. More
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)

Alexander S. Bondarenko - Summer 1998
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
  :lib => "CUTEst:PINENE, COPS:5",
)
get_pinene_nvar(; n::Integer = default_nvar, kwargs...) = 50 * n + 5
get_pinene_ncon(; n::Integer = default_nvar, kwargs...) = 50 * n + 0
get_pinene_nlin(; n::Integer = default_nvar, kwargs...) = 35 * n + 0
get_pinene_nnln(; n::Integer = default_nvar, kwargs...) = 15 * n + 0
get_pinene_nequ(; n::Integer = default_nvar, kwargs...) = 50 * n + 0
get_pinene_nineq(; n::Integer = default_nvar, kwargs...) = 0
