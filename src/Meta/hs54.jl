hs54_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs54",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 54.

  Source:
  Problem 54 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification GLR2-AN-6-1

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs54_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_hs54_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs54_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs54_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs54_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs54_nineq(; n::Integer = default_nvar, kwargs...) = 0
