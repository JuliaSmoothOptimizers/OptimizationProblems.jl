hs24_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs24",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.013364589564574673,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS24.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 24.

classification OLR2-AN-2-3

classification PLR2-AN-2-3

A. Montoison, Montreal, 04/2018.
""",
  :origin_notes => raw"""
  problem 24 in
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
  :lib => "CUTEst:HS24, HS:24",
)
get_hs24_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs24_ncon(; n::Int = default_nvar, kwargs...) = 2
get_hs24_nlin(; n::Int = default_nvar, kwargs...) = 2
get_hs24_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs24_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs24_nineq(; n::Int = default_nvar, kwargs...) = 2
