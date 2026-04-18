hs50_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs50",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 7516.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 50.

  Source:
  Problem 50 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification PLR2-AN-5-3

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs50_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs50_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs50_nlin(; n::Integer = default_nvar, kwargs...) = 3
get_hs50_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs50_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs50_nineq(; n::Integer = default_nvar, kwargs...) = 0
