hs48_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs48",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 84.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS48.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 48.

  classification QLR2-AN-5-2

A. Montoison, Montreal, 05/2018.
""",
:origin_notes => raw"""
  Problem 48 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

---
Problem :
Source: problem 48 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.
SIF input: A.R. Conn, April 1990
classification SLR2-AY-5-2
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

  :lib => "CUTEst:HS48, HS:48",
)
get_hs48_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs48_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs48_nlin(; n::Integer = default_nvar, kwargs...) = 2
get_hs48_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs48_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs48_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_hs48_nls_nequ(; n::Integer = default_nvar, kwargs...) = 3