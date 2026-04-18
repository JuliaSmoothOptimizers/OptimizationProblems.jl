hs69_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs69",
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
  :url => "",
  :notes => raw"""Hock and Schittkowski problem number 69.

  classification GGR-P1-2

Original source:
E. von Collani, Kostenoptimale Prufplane bei laufender
Kontrolle eines normalverteilten Merkmals, Dissertation,
Institut fur Angewandte Mathematik und Statistik, Universitat Wurzburg, 1978.
""",
:origin_notes => raw"""
  Problem 69 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

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

)
get_hs69_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs69_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs69_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs69_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs69_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs69_nineq(; n::Integer = default_nvar, kwargs...) = 0