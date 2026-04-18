hs33_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs33",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -3.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 33.

  Source:
  Problem 33 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification PQR2-AN-3-2

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs33_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs33_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs33_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs33_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs33_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs33_nineq(; n::Integer = default_nvar, kwargs...) = 2
