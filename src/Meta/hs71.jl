hs71_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs71",
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
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS71.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 71.

classification OOR2-AY-4-2

classification PPR2-AN-4-2

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 71 in
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
  :lib => "CUTEst:HS71, HS:71",
)
get_hs71_nvar(; n::Int = default_nvar, kwargs...) = 4
get_hs71_ncon(; n::Int = default_nvar, kwargs...) = 2
get_hs71_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs71_nnln(; n::Int = default_nvar, kwargs...) = 2
get_hs71_nequ(; n::Int = default_nvar, kwargs...) = 1
get_hs71_nineq(; n::Int = default_nvar, kwargs...) = 1
