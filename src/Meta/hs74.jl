hs74_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs74",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS74.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 74.

classification OOR2-AY-4-5

classification PGR-AN-4-5

A. Montoison, Montreal, 05/2018.
""",
:origin_notes => raw"""
problem 74 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.

SIF input: B Debarsy, Apr 1990.
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

  :lib => "CUTEst:HS74, HS:74",
)
get_hs74_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs74_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs74_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs74_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs74_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs74_nineq(; n::Integer = default_nvar, kwargs...) = 1