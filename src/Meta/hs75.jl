hs75_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs75",
  :has_equalities_only => false,
  :has_inequalities_only => false,
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS75.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 75.

classification OOR2-AY-4-5

classification PGR-AN-4-5

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
  problem 75 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: B Debarsy, Apr 1990.
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
  :lib => "CUTEst:HS75, HS:75",
)
get_hs75_nvar(; n::Int = default_nvar, kwargs...) = 4
get_hs75_ncon(; n::Int = default_nvar, kwargs...) = 4
get_hs75_nlin(; n::Int = default_nvar, kwargs...) = 1
get_hs75_nnln(; n::Int = default_nvar, kwargs...) = 3
get_hs75_nequ(; n::Int = default_nvar, kwargs...) = 3
get_hs75_nineq(; n::Int = default_nvar, kwargs...) = 1
