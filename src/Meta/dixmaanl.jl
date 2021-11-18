dixmaanl_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixmaanl",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 4903.696206509544,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_dixmaanl_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + -2
get_dixmaanl_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanl_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanl_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanl_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanl_nineq(; n::Integer = default_nvar, kwargs...) = 0
