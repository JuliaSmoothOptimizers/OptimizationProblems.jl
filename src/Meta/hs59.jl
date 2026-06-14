hs59_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs59",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS59.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 54.

classification OQR2-AN-2-3

classification GLR2-AN-6-1

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 59 (corrected) in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: A.R. Conn and Ph.L. Toint, November 1990.
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
  :lib => "CUTEst:HS59, HS:59",
)
get_hs59_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs59_ncon(; n::Int = default_nvar, kwargs...) = 3
get_hs59_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs59_nnln(; n::Int = default_nvar, kwargs...) = 3
get_hs59_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs59_nineq(; n::Int = default_nvar, kwargs...) = 3
