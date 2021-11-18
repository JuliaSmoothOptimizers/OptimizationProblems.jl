noncvxun_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "noncvxun",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.7270107614155663e6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_noncvxun_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_noncvxun_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxun_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxun_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxun_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxun_nineq(; n::Integer = default_nvar, kwargs...) = 0
