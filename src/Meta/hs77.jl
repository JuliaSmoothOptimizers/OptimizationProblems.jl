hs77_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs77",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS77.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 77.

classification OOR2-AY-5-2

classification PGR-AN-5-2

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 77 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: A. Conn and Ph. Toint, March 1991
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
  :lib => "CUTEst:HS77, HS:77",
)
get_hs77_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs77_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs77_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs77_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs77_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs77_nineq(; n::Integer = default_nvar, kwargs...) = 0
