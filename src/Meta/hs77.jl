hs77_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs77",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""Hock and Schittkowski problem number 77.

  Source:
  Problem 77 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification PGR-AN-5-2

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs77_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs77_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs77_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs77_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs77_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs77_nineq(; n::Integer = default_nvar, kwargs...) = 0
