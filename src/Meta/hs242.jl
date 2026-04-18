hs242_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs242",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
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
Hock and Schittkowski problem number 242.

  Source:
  Problem 242 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs242_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs242_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs242_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs242_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs242_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs242_nineq(; n::Integer = default_nvar, kwargs...) = 0
