hs38_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs38",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 19192.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS38.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 38.

Colville #4 test problem

classification OBR2-AN-4-0

classification PLR2-AN-4-0

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 38 in
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
  :lib => "CUTEst:HS38, HS:38",
)
get_hs38_nvar(; n::Int = default_nvar, kwargs...) = 4
get_hs38_ncon(; n::Int = default_nvar, kwargs...) = 0
get_hs38_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs38_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs38_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs38_nineq(; n::Int = default_nvar, kwargs...) = 0
