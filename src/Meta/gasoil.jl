gasoil_meta = Dict(
  :nvar => 2603,
  :variable_nvar => true,
  :ncon => 2600,
  :variable_ncon => true,
  :minimize => true,
  :name => "gasoil",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/GASOIL.SIF",
  :notes => raw"""
Catalytic Cracking of Gas Oil Problem
Collocation formulation

Determine the reaction coefficients for the catalytic cracking of gas oil
and other byproducts. The nonlinear model that describes the process is
y_1' = - (theta_1 + theta_3 ) y_1^2
y_2' = theta_1 y_1^2 + theta_2 y_2
with given initial conditions. The problem is to minimize
sum{i=1,20} || y(tau_i,theta) - z_i||^2
where the z_i are concentration measurements for y at times tau_i (i=1,20)

classification OOR2-AN-V-V
""",
  :origin_notes => raw"""
This is problem 12 in the COPS (Version 2) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2000)

Michael Merritt - Summer 2000
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
  :lib => "CUTEst:GASOIL, COPS:12",
)
get_gasoil_nvar(; n::Int = default_nvar, kwargs...) = 26 * n + 3
get_gasoil_ncon(; n::Int = default_nvar, kwargs...) = 26 * n + 0
get_gasoil_nlin(; n::Int = default_nvar, kwargs...) = 18 * n + 0
get_gasoil_nnln(; n::Int = default_nvar, kwargs...) = 8 * n + 0
get_gasoil_nequ(; n::Int = default_nvar, kwargs...) = 26 * n + 0
get_gasoil_nineq(; n::Int = default_nvar, kwargs...) = 0
