hs73_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs73",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS73.SIF",
  :notes => raw"""Hock and Schittkowski problem number 73.

  classification LGI-AN-4-3

A. Montoison, Montreal, 05/2018.
""",
:origin_notes => raw"""
  Problem 73 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

---
Problem :
A cattle feed problem
Source: problem 73 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.
SIF input: B Debarsy, Apr 1990.
classification LOR2-MN-4-3
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

  :lib => "CUTEst:HS73, HS:73",
)
get_hs73_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs73_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs73_nlin(; n::Integer = default_nvar, kwargs...) = 2
get_hs73_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs73_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs73_nineq(; n::Integer = default_nvar, kwargs...) = 2