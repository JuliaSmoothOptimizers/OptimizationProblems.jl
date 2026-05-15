hs76_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs76",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -1.25,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS76.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 76.

classification QLR2-AN-4-3

classification QLR-AN-4-3

A. Montoison, Montreal, 05/2018.
""",
:origin_notes => raw"""
problem 76 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.

SIF input: A.R. Conn, March 1991.
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

  :lib => "CUTEst:HS76, HS:76",
)
get_hs76_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs76_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs76_nlin(; n::Integer = default_nvar, kwargs...) = 3
get_hs76_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs76_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs76_nineq(; n::Integer = default_nvar, kwargs...) = 3