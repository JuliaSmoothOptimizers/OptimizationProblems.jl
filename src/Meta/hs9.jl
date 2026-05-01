hs9_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs9",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS9.SIF",
  :notes => raw"""Hock and Schittkowski problem number 9.

  classification OLR2-AN-2-1

A. Cebola, Curitiba , 10/2016.
""",
:origin_notes => raw"""
  Problem 9 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

---
Problem :
Source: problem 9 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.
SIF input: A.R. Conn March 1990
classification OLR2-AN-2-1
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

  :lib => "CUTEst:HS9, HS:9",
)
get_hs9_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs9_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs9_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs9_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs9_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs9_nineq(; n::Integer = default_nvar, kwargs...) = 0