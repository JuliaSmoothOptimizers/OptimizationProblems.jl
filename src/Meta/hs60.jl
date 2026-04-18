hs60_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs60",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes =>
    raw"""Hock and Schittkowski problem number 60.\n\n  Source:\n  Problem 60 in\n  W. Hock and K. Schittkowski,\n  Test examples for nonlinear programming codes,\n  Lectures Notes in Economics and Mathematical Systems 187,\n  Springer Verlag, Heidelberg, 1981.\n\n  classification PPR2-AN-3-1\n\nA. Montoison, Montreal, 05/2018.\n""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs60_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs60_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs60_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs60_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs60_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs60_nineq(; n::Integer = default_nvar, kwargs...) = 0
