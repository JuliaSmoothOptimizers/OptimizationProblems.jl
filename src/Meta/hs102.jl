hs102_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs102",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS102.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 102.

classification OOR2-AN-7-5

classification PPR-AN-7-6

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 102 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: N. Gould, December 1989.
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
  :lib => "CUTEst:HS102, HS:102",
)
get_hs102_nvar(; n::Int = default_nvar, kwargs...) = 7
get_hs102_ncon(; n::Int = default_nvar, kwargs...) = 5
get_hs102_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs102_nnln(; n::Int = default_nvar, kwargs...) = 5
get_hs102_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs102_nineq(; n::Int = default_nvar, kwargs...) = 5
