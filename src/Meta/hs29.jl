hs29_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs29",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -1.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 29.

  classification PQR2-AN-3-1

A. Montoison, Montreal, 04/2018.
""",
:origin_notes => raw"""
  Problem 29 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

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

)
get_hs29_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs29_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs29_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs29_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs29_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs29_nineq(; n::Integer = default_nvar, kwargs...) = 1