hs13_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs13",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS13.SIF",
  :notes => raw"""
 Hock and Schittkowski problem number 13.

   classification QQR2-AN-2-1

 N. Antunes, Curitiba, 10/2016.  
  """,
:origin_notes => raw"""
   Problem 13 in
   W. Hock and K. Schittkowski,
   Test examples for nonlinear programming codes,
   Lectures Notes in Economics and Mathematical Systems 187,
   Springer Verlag, Heidelberg, 1981.

---
Problem :
A problem in 2 variables where constraint qualification does not
hold.
Source: problem 13 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.
SIF input: A.R. Conn March 1990
classification QOR2-AN-2-1
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

  :lib => "CUTEst:HS13, HS:13",
)
get_hs13_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs13_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs13_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs13_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs13_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs13_nineq(; n::Integer = default_nvar, kwargs...) = 1
get_hs13_nls_nequ(; n::Integer = default_nvar, kwargs...) = 2