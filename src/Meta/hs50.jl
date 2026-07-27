hs50_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs50",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 7516.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS50.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 50.

classification OLR2-AY-5-3

classification PLR2-AN-5-3

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 50 in
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
  :lib => "CUTEst:HS50, HS:50",
)
get_hs50_nvar(; n::Int = default_nvar, kwargs...) = 5
get_hs50_ncon(; n::Int = default_nvar, kwargs...) = 3
get_hs50_nlin(; n::Int = default_nvar, kwargs...) = 3
get_hs50_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs50_nequ(; n::Int = default_nvar, kwargs...) = 3
get_hs50_nineq(; n::Int = default_nvar, kwargs...) = 0
