hs35_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs35",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.25,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 35.

  Source:
  Problem 35 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification QLR2-AN-3-1

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs35_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs35_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs35_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs35_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs35_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs35_nineq(; n::Integer = default_nvar, kwargs...) = 1
