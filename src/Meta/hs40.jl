hs40_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs40",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS40.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 40.

classification OOR2-AN-4-3

D. Cabral, Curitiba, 10/2016.
""",
  :origin_notes => raw"""
  problem 40 in
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
  :lib => "CUTEst:HS40, HS:40",
)
get_hs40_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs40_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs40_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs40_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs40_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs40_nineq(; n::Integer = default_nvar, kwargs...) = 0
