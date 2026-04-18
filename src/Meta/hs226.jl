hs226_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs226",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -0.5,
  :best_known_upper_bound => -0.5,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 226.

  Source:
  Problem 226 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs226_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs226_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs226_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs226_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs226_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs226_nineq(; n::Integer = default_nvar, kwargs...) = 2
