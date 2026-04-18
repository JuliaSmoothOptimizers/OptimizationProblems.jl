hs47_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs47",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 20.738077488610624,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 47.

  Source:
  Problem 47 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.

  classification PPR2-AN-5-3

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs47_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs47_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs47_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs47_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs47_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs47_nineq(; n::Integer = default_nvar, kwargs...) = 0
