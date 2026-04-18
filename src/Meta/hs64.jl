hs64_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs64",
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
  :url => "",
  :notes => raw"""Hock and Schittkowski problem number 64.

  Source:
  Problem 64 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification PPR2-AN-3-1

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs64_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs64_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs64_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs64_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs64_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs64_nineq(; n::Integer = default_nvar, kwargs...) = 1
