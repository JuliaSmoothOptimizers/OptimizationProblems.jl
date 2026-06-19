hs83_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs83",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS83.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 83.

classification QQR2-AN-5-3

classification QQR-AN-5-3

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 83 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: B Baudson, Apr 1989.
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
  :lib => "CUTEst:HS83, HS:83",
)
get_hs83_nvar(; n::Int = default_nvar, kwargs...) = 5
get_hs83_ncon(; n::Int = default_nvar, kwargs...) = 3
get_hs83_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs83_nnln(; n::Int = default_nvar, kwargs...) = 3
get_hs83_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs83_nineq(; n::Int = default_nvar, kwargs...) = 3
