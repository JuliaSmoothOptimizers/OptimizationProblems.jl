hs61_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs61",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS61.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 61.
classification QQR2-AN-3-2
A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
Problem 61 in
W. Hock and K. Schittkowski,
Test examples for nonlinear programming codes,
Lectures Notes in Economics and Mathematical Systems 187,
Springer Verlag, Heidelberg, 1981.
  ---
Problem :
Source: problem 61 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.
SIF input: Ph.L. Toint, November 1990.
classification QQR2-AN-3-2
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

  :lib => "CUTEst:HS61, HS:61",
)
get_hs61_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs61_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs61_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs61_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs61_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs61_nineq(; n::Integer = default_nvar, kwargs...) = 0
