hs26_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs26",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 21.159999999999997,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS26.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 26.

classification OOR2-AY-3-1

A. Cebola, Curitiba 10/2016.
""",
  :origin_notes => raw"""
  problem 26 in
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
  :lib => "CUTEst:HS26, HS:26",
)
get_hs26_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs26_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs26_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs26_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs26_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs26_nineq(; n::Integer = default_nvar, kwargs...) = 0
