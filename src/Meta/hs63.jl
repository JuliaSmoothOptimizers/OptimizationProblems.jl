hs63_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs63",
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
    raw"""Hock and Schittkowski problem number 63.\n\n  Source:\n  Problem 63 in\n  W. Hock and K. Schittkowski,\n  Test examples for nonlinear programming codes,\n  Lectures Notes in Economics and Mathematical Systems 187,\n  Springer Verlag, Heidelberg, 1981.\n\n  classification QQR2-AN-3-2\n\nA. Montoison, Montreal, 05/2018.\n""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs63_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs63_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs63_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs63_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs63_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs63_nineq(; n::Integer = default_nvar, kwargs...) = 0
