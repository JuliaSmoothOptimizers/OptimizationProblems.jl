hs27_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs27",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 27.

  Source:
  Problem 27 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification SQR2-AN-3-1

A. Cebola, Curitiba 10/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs27_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs27_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs27_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs27_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs27_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs27_nineq(; n::Integer = default_nvar, kwargs...) = 0
