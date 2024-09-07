bqp1var_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "bqp1var",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.3125,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_bqp1var_nvar(; n::Integer = default_nvar, kwargs...) = 1
get_bqp1var_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_bqp1var_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_bqp1var_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_bqp1var_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_bqp1var_nineq(; n::Integer = default_nvar, kwargs...) = 1
