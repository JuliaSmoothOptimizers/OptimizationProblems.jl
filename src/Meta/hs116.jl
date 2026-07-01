hs116_meta = Dict(
  :nvar => 13,
  :variable_nvar => false,
  :ncon => 15,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs116",
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
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS116.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 116.

A 3 stage membrane separation model

classification LQR2-MN-13-14

classification QGR-AN-13-14

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 116 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: B. Debarsy, Feb 1990.
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
  :lib => "CUTEst:HS116, HS:116",
)
get_hs116_nvar(; n::Int = default_nvar, kwargs...) = 13
get_hs116_ncon(; n::Int = default_nvar, kwargs...) = 15
get_hs116_nlin(; n::Int = default_nvar, kwargs...) = 5
get_hs116_nnln(; n::Int = default_nvar, kwargs...) = 10
get_hs116_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs116_nineq(; n::Int = default_nvar, kwargs...) = 15
