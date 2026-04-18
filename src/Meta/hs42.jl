hs42_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs42",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 42.

  Source:
  Problem 42 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification QQR2-AN-4-1

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs42_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs42_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs42_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs42_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs42_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs42_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_hs42_nls_nequ(; n::Integer = default_nvar, kwargs...) = 4
