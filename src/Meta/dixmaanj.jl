dixmaanj_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixmaanj",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1281.3263187429854,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_dixmaanj_nvar(; n::Integer = default_nvar, kwargs...) = 3 * max(1, div(n, 3))
get_dixmaanj_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanj_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanj_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanj_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanj_nineq(; n::Integer = default_nvar, kwargs...) = 0
