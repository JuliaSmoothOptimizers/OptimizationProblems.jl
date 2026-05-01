hs113_meta = Dict(
  :nvar => 10,
  :variable_nvar => false,
  :ncon => 8,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs113",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 753.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS113.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 113.

  classification QQR-AN-10-8

A. Montoison, Montreal, 05/2018.
""",
:origin_notes => raw"""
  Problem 113 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.
  
---
Problem :
Source: problem 80 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.
SIF input: J-M Collin, Mar 1990.
classification QQR2-AN-10-8
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

  :lib => "CUTEst:HS113, HS:113",
)
get_hs113_nvar(; n::Integer = default_nvar, kwargs...) = 10
get_hs113_ncon(; n::Integer = default_nvar, kwargs...) = 8
get_hs113_nlin(; n::Integer = default_nvar, kwargs...) = 3
get_hs113_nnln(; n::Integer = default_nvar, kwargs...) = 5
get_hs113_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs113_nineq(; n::Integer = default_nvar, kwargs...) = 8