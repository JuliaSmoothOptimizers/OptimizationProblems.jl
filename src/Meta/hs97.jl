hs97_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs97",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS97.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 97.

classification LQR2-AN-6-4

classification PPR-AN-6-4

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 97 in
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
  :lib => "CUTEst:HS97, HS:97",
)
get_hs97_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_hs97_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs97_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs97_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_hs97_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs97_nineq(; n::Integer = default_nvar, kwargs...) = 4
