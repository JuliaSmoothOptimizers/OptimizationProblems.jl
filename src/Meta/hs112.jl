hs112_meta = Dict(
  :nvar => 10,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs112",
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
Hock and Schittkowski problem number 112.

  Source:
  Problem 112 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification OLR2-MY-10-3

N. Antunes, Curitiba, 10/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs112_nvar(; n::Integer = default_nvar, kwargs...) = 10
get_hs112_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs112_nlin(; n::Integer = default_nvar, kwargs...) = 3
get_hs112_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs112_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs112_nineq(; n::Integer = default_nvar, kwargs...) = 0
