hs43_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs43",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS43.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 43.

The Rosen-Suzuki test problem.

classification QQR2-AN-4-3

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 43 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: A.R. Conn, April 1990
  """,
  :reference => raw"""
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
  :lib => "CUTEst:HS43, HS:43",
)
get_hs43_nvar(; n::Int = default_nvar, kwargs...) = 4
get_hs43_ncon(; n::Int = default_nvar, kwargs...) = 3
get_hs43_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs43_nnln(; n::Int = default_nvar, kwargs...) = 3
get_hs43_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs43_nineq(; n::Int = default_nvar, kwargs...) = 3
