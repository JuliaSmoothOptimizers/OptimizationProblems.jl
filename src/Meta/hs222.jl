hs222_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs222",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -1.5,
  :best_known_upper_bound => -1.3,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 222.

  Source:
  Problem 222 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs222_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs222_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs222_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs222_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs222_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs222_nineq(; n::Integer = default_nvar, kwargs...) = 1
