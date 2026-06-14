hs66_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs66",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.58,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS66.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 66.

classification LOR2-AN-3-2

classification LGR2-AN-3-2

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 66 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: B Baudson, March 1990.
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
  :lib => "CUTEst:HS66, HS:66",
)
get_hs66_nvar(; n::Int = default_nvar, kwargs...) = 3
get_hs66_ncon(; n::Int = default_nvar, kwargs...) = 2
get_hs66_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs66_nnln(; n::Int = default_nvar, kwargs...) = 2
get_hs66_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs66_nineq(; n::Int = default_nvar, kwargs...) = 2
