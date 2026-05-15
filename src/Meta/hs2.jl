hs2_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 909.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS2.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 2.

The ever famous 2 variables Rosenbrock "banana valley" problem
with a single lower bound.

classification SBR2-AN-2-0

classification PBR2-AN-2-0

A. Montoison, Montreal, 04/2018.
""",
:origin_notes => raw"""
problem 2 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.

SIF input: A.R. Conn, March 1990.
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

  :lib => "CUTEst:HS2, HS:2",
)
get_hs2_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs2_nineq(; n::Integer = default_nvar, kwargs...) = 0