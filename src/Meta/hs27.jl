hs27_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs27",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS27.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 27.

classification SQR2-AN-3-1

A. Cebola, Curitiba 10/2016.
""",
  :origin_notes => raw"""
  problem 27 in
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
  :lib => "CUTEst:HS27, HS:27",
)
get_hs27_nvar(; n::Int = default_nvar, kwargs...) = 3
get_hs27_ncon(; n::Int = default_nvar, kwargs...) = 1
get_hs27_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs27_nnln(; n::Int = default_nvar, kwargs...) = 1
get_hs27_nequ(; n::Int = default_nvar, kwargs...) = 1
get_hs27_nineq(; n::Int = default_nvar, kwargs...) = 0
