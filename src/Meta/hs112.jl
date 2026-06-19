hs112_meta = Dict(
  :nvar => 10,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs112",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS112.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 112.

This problem is a chemical equilibrium problem involving 3 linear
equality constraints.

classification OLR2-MY-10-3

N. Antunes, Curitiba, 10/2016.
""",
  :origin_notes => raw"""
  Problem 112 in
    W. Hock and K. Schittkowski,
    Test examples for nonlinear programming codes,
    Lectures Notes in Economics and Mathematical Systems 187,
    Springer Verlag, Heidelberg, 1981.

  problem 80 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: A.R. Conn, Mar 1990.
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
  :lib => "CUTEst:HS112, HS:112",
)
get_hs112_nvar(; n::Int = default_nvar, kwargs...) = 10
get_hs112_ncon(; n::Int = default_nvar, kwargs...) = 3
get_hs112_nlin(; n::Int = default_nvar, kwargs...) = 3
get_hs112_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs112_nequ(; n::Int = default_nvar, kwargs...) = 3
get_hs112_nineq(; n::Int = default_nvar, kwargs...) = 0
