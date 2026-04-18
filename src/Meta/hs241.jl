hs241_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs241",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => 0,
  :best_known_upper_bound => 0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 241.

  Source:
  Problem 241 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs241_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs241_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs241_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs241_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs241_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs241_nineq(; n::Integer = default_nvar, kwargs...) = 0
