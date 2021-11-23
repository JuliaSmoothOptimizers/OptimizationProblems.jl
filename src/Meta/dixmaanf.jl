dixmaanf_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixmaanf",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1348.4166666666667,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_dixmaanf_nvar(; n::Integer = default_nvar, kwargs...) = 3 * max(1, div(n, 3))
get_dixmaanf_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanf_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanf_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanf_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanf_nineq(; n::Integer = default_nvar, kwargs...) = 0
