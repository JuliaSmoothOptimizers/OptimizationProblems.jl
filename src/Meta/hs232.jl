hs232_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs232",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -1,
  :best_known_upper_bound => -1,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 232.

  Source:
  Problem 232 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs232_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs232_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs232_nlin(; n::Integer = default_nvar, kwargs...) = 3
get_hs232_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs232_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs232_nineq(; n::Integer = default_nvar, kwargs...) = 3
