hs30_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs30",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 3.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS30.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 30.

classification QQR2-AN-3-1

A. Montoison, Montreal, 04/2018.
""",
  :origin_notes => raw"""
  problem 30 in
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
  :lib => "CUTEst:HS30, HS:30",
)
get_hs30_nvar(; n::Int = default_nvar, kwargs...) = 3
get_hs30_ncon(; n::Int = default_nvar, kwargs...) = 1
get_hs30_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs30_nnln(; n::Int = default_nvar, kwargs...) = 1
get_hs30_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs30_nineq(; n::Int = default_nvar, kwargs...) = 1
get_hs30_nls_nequ(; n::Int = default_nvar, kwargs...) = 3
