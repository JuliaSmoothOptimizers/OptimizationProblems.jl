hs39_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs39",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS39.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 39.

classification LOR2-AN-4-2

D. Cabral, Curitiba, 10/2016.
""",
  :origin_notes => raw"""
  problem 39 in
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
  :lib => "CUTEst:HS39, HS:39",
)
get_hs39_nvar(; n::Int = default_nvar, kwargs...) = 4
get_hs39_ncon(; n::Int = default_nvar, kwargs...) = 2
get_hs39_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs39_nnln(; n::Int = default_nvar, kwargs...) = 2
get_hs39_nequ(; n::Int = default_nvar, kwargs...) = 2
get_hs39_nineq(; n::Int = default_nvar, kwargs...) = 0
