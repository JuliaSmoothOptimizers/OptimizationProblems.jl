hs238_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs238",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -58.9034,
  :best_known_upper_bound => -58.9034,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 238.

  Source:
  Problem 238 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs238_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs238_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs238_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs238_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs238_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs238_nineq(; n::Integer = default_nvar, kwargs...) = 3
