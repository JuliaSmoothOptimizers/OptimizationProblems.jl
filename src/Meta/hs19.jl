hs19_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs19",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS19.SIF",
  :notes => raw"""
 Hock and Schittkowski problem number 19.

   classification PQR2-AN-2-2

 A. Montoison, Montreal, 04/2018.  
  """,
:origin_notes => raw"""
   Problem 19 in
   W. Hock and K. Schittkowski,
   Test examples for nonlinear programming codes,
   Lectures Notes in Economics and Mathematical Systems 187,
   Springer Verlag, Heidelberg, 1981.

---
Problem :
Source: problem 19 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.
SIF input: A.R. Conn April 1990
classification OQR2-AN-2-2
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

  :lib => "CUTEst:HS19, HS:19",
)
get_hs19_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs19_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs19_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs19_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs19_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs19_nineq(; n::Integer = default_nvar, kwargs...) = 2