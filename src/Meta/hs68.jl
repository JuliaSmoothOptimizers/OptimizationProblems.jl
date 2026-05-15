hs68_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs68",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS68.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 68.

This is a cost optimal inspection plan.

classification OOR2-MN-4-2

classification GGR-P1-1
""",
  :origin_notes => raw"""
  Original source:
  E. von Collani, Kostenoptimale Prufplane bei laufender
  Kontrolle eines normalverteilten Merkmals, Dissertation,
  Institut fur Angewandte Mathematik und Statistik, Universitat Wurzburg, 1978.

  problem 68 in
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
  :lib => "CUTEst:HS68, HS:68",
)
get_hs68_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs68_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs68_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs68_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs68_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs68_nineq(; n::Integer = default_nvar, kwargs...) = 0
