hs6_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs6",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes =>
    raw"""Hock and Schittkowski problem number 6.\n\n  Source:\n  Problem 6 in\n  W. Hock and K. Schittkowski,\n  Test examples for nonlinear programming codes,\n  Lectures Notes in Economics and Mathematical Systems 187,\n  Springer Verlag, Heidelberg, 1981.\n\n  classification QQR2-AN-2-1\n\nD. Orban, Montreal, 04/2016.\n""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs6_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs6_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs6_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs6_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs6_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs6_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_hs6_nls_nequ(; n::Integer = default_nvar, kwargs...) = 1
