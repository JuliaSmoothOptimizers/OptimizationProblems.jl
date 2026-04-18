hs3_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs3",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.00081,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 3.

  Source:
  Problem 3 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification QBR2-AN-2-0

N. Antunes, Curitiba, 10/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs3_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs3_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs3_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs3_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs3_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs3_nineq(; n::Integer = default_nvar, kwargs...) = 0
