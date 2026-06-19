hs28_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs28",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 13.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS28.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 28.

classification SLR2-AY-3-1

classification QLR2-AN-3-1

A. Montoison, Montreal, 04/2018.
""",
  :origin_notes => raw"""
  problem 28 in
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
  :lib => "CUTEst:HS28, HS:28",
)
get_hs28_nvar(; n::Int = default_nvar, kwargs...) = 3
get_hs28_ncon(; n::Int = default_nvar, kwargs...) = 1
get_hs28_nlin(; n::Int = default_nvar, kwargs...) = 1
get_hs28_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs28_nequ(; n::Int = default_nvar, kwargs...) = 1
get_hs28_nineq(; n::Int = default_nvar, kwargs...) = 0
get_hs28_nls_nequ(; n::Int = default_nvar, kwargs...) = 2
