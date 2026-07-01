hs55_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 6,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs55",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS55.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 54.

classification OLR2-AN-6-6

classification GLR2-AN-6-1

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 55 in
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
  :lib => "CUTEst:HS55, HS:55",
)
get_hs55_nvar(; n::Int = default_nvar, kwargs...) = 6
get_hs55_ncon(; n::Int = default_nvar, kwargs...) = 6
get_hs55_nlin(; n::Int = default_nvar, kwargs...) = 6
get_hs55_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs55_nequ(; n::Int = default_nvar, kwargs...) = 6
get_hs55_nineq(; n::Int = default_nvar, kwargs...) = 0
