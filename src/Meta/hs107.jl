hs107_meta = Dict(
  :nvar => 9,
  :variable_nvar => false,
  :ncon => 6,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs107",
  :has_equalities_only => true,
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS107.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 107.

A static power scheduling problem.
There are note enough components for the starting point in the
problem description in the source.  The initial value for X7 has
been set to 1.0454, as for X5 and X6.

classification OOR2-MY-9-6

classification PGR-AN-9-6

A. Montoison, Montreal, 05/2018.
""",
:origin_notes => raw"""
problem 107 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.

SIF input: Ph. Toint, April 1991.
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

  :lib => "CUTEst:HS107, HS:107",
)
get_hs107_nvar(; n::Integer = default_nvar, kwargs...) = 9
get_hs107_ncon(; n::Integer = default_nvar, kwargs...) = 6
get_hs107_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs107_nnln(; n::Integer = default_nvar, kwargs...) = 6
get_hs107_nequ(; n::Integer = default_nvar, kwargs...) = 6
get_hs107_nineq(; n::Integer = default_nvar, kwargs...) = 0