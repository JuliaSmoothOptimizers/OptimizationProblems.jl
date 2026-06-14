hs16_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs16",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS16.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 16.

classification SQR2-AN-2-2

 N. Antunes, Curitiba, 10/2016.
""",
  :origin_notes => raw"""
  problem 16 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: A.R. Conn March 1990
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
  :lib => "CUTEst:HS16, HS:16",
)
get_hs16_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs16_ncon(; n::Int = default_nvar, kwargs...) = 2
get_hs16_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs16_nnln(; n::Int = default_nvar, kwargs...) = 2
get_hs16_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs16_nineq(; n::Int = default_nvar, kwargs...) = 2
