hs70_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs70",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.9878587518178731,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""Hock and Schittkowski problem number 70.

  Source:
  Problem 70 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification SQR2-AN-4-1

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs70_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs70_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs70_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs70_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs70_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs70_nineq(; n::Integer = default_nvar, kwargs...) = 1
