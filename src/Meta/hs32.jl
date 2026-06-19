hs32_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs32",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 7.199999999999999,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS32.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 32.

classification SOR2-AY-3-2

classification QPR2-AN-3-2

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 32 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: J-M COLLIN, April 1990.
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
  :lib => "CUTEst:HS32, HS:32",
)
get_hs32_nvar(; n::Int = default_nvar, kwargs...) = 3
get_hs32_ncon(; n::Int = default_nvar, kwargs...) = 2
get_hs32_nlin(; n::Int = default_nvar, kwargs...) = 1
get_hs32_nnln(; n::Int = default_nvar, kwargs...) = 1
get_hs32_nequ(; n::Int = default_nvar, kwargs...) = 1
get_hs32_nineq(; n::Int = default_nvar, kwargs...) = 1
