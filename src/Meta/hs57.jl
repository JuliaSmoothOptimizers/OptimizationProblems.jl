hs57_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs57",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.030798601687933858,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes =>
    raw"""Hock and Schittkowski problem number 57.\n\n  Source:\n  Problem 57 in\n  W. Hock and K. Schittkowski,\n  Test examples for nonlinear programming codes,\n  Lectures Notes in Economics and Mathematical Systems 187,\n  Springer Verlag, Heidelberg, 1981.\n\n  classification SQR-AN-2-1\n\nA. Montoison, Montreal, 05/2018.\n""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs57_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs57_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs57_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs57_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs57_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs57_nineq(; n::Integer = default_nvar, kwargs...) = 1
get_hs57_nls_nequ(; n::Integer = default_nvar, kwargs...) = 44
