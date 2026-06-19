hs117_meta = Dict(
  :nvar => 15,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs117",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2400.1053000599995,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS117.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 117.

classification OQR2-AN-15-5

classification PQR-AN-15-5

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 117 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: Nick Gould, August 1991.
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
  :lib => "CUTEst:HS117, HS:117",
)
get_hs117_nvar(; n::Int = default_nvar, kwargs...) = 15
get_hs117_ncon(; n::Int = default_nvar, kwargs...) = 5
get_hs117_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs117_nnln(; n::Int = default_nvar, kwargs...) = 5
get_hs117_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs117_nineq(; n::Int = default_nvar, kwargs...) = 5
