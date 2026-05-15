hs34_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs34",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS34.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 34.

classification LOR2-AN-3-2

classification LGR2-AN-3-2

A. Montoison, Montreal, 05/2018.
""",
:origin_notes => raw"""
problem 34 in
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

  :lib => "CUTEst:HS34, HS:34",
)
get_hs34_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs34_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs34_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs34_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs34_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs34_nineq(; n::Integer = default_nvar, kwargs...) = 2