noncvxu2_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "noncvxu2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.639748043568829e6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_noncvxu2_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_noncvxu2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxu2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxu2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxu2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxu2_nineq(; n::Integer = default_nvar, kwargs...) = 0
