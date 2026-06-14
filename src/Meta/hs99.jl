hs99_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs99",
  :has_equalities_only => true,
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
  :url => "https://bitbucket.org/optrove/sif/src/master/HS99.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 99.

classification OOR2-AN-7-2

classification PPR-AN-6-4
""",
  :origin_notes => raw"""
  problem 99 in
  W. Hock and K. Schittkowski,
  "Test examples for nonlinear programming codes",
  Lectures Notes in Economics and Mathematical Systems 187, Springer
  Verlag, Heidelberg, 1981.

  SIF input: Ph. Toint, April 1991.
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
  :lib => "CUTEst:HS99, HS:99",
)
get_hs99_nvar(; n::Int = default_nvar, kwargs...) = 7
get_hs99_ncon(; n::Int = default_nvar, kwargs...) = 2
get_hs99_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs99_nnln(; n::Int = default_nvar, kwargs...) = 2
get_hs99_nequ(; n::Int = default_nvar, kwargs...) = 2
get_hs99_nineq(; n::Int = default_nvar, kwargs...) = 0
