hs64_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs64",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS64.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 64.

classification OOR2-AN-3-1

classification PPR2-AN-3-1

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 64 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: N. Gould, Dec 1989.
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
  :lib => "CUTEst:HS64, HS:64",
)
get_hs64_nvar(; n::Int = default_nvar, kwargs...) = 3
get_hs64_ncon(; n::Int = default_nvar, kwargs...) = 1
get_hs64_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs64_nnln(; n::Int = default_nvar, kwargs...) = 1
get_hs64_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs64_nineq(; n::Int = default_nvar, kwargs...) = 1
