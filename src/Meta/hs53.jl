hs53_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs53",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS53.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 53.

classification QLR2-AY-5-3

classification QLR2-AN-5-3

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 53 in
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
  :lib => "CUTEst:HS53, HS:53",
)
get_hs53_nvar(; n::Int = default_nvar, kwargs...) = 5
get_hs53_ncon(; n::Int = default_nvar, kwargs...) = 3
get_hs53_nlin(; n::Int = default_nvar, kwargs...) = 3
get_hs53_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs53_nequ(; n::Int = default_nvar, kwargs...) = 3
get_hs53_nineq(; n::Int = default_nvar, kwargs...) = 0
get_hs53_nls_nequ(; n::Int = default_nvar, kwargs...) = 4
