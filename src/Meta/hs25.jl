hs25_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs25",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 32.834999999663594,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS25.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 25.

A nonlinear least squares problem with bounds.

classification SBR2-AN-3-0

A. Montoison, Montreal, 04/2018.
""",
:origin_notes => raw"""
problem 25 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.

SIF input: J-M Collin, Mar 1990.
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

  :lib => "CUTEst:HS25, HS:25",
)
get_hs25_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs25_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs25_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs25_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs25_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs25_nineq(; n::Integer = default_nvar, kwargs...) = 0