hs251_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs251",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -3456,
  :best_known_upper_bound => -3456,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 251.

  Source:
  Problem 251 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs251_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs251_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs251_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs251_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs251_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs251_nineq(; n::Integer = default_nvar, kwargs...) = 1
