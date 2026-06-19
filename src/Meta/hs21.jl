hs21_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs21",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS21.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 21.

classification QLR2-AN-2-1

 A. Montoison, Montreal, 04/2018.
""",
  :origin_notes => raw"""
  problem 21 in
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
  :lib => "CUTEst:HS21, HS:21",
)
get_hs21_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs21_ncon(; n::Int = default_nvar, kwargs...) = 1
get_hs21_nlin(; n::Int = default_nvar, kwargs...) = 1
get_hs21_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs21_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs21_nineq(; n::Int = default_nvar, kwargs...) = 1
