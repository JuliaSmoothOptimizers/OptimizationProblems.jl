steering_meta = Dict(
  :nvar => 506,
  :variable_nvar => true,
  :ncon => 408,
  :variable_ncon => true,
  :minimize => true,
  :name => "steering",
  :has_equalities_only => false,
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
)
get_steering_nvar(; n::Integer = default_nvar, kwargs...) = 5 * n + 6
get_steering_ncon(; n::Integer = default_nvar, kwargs...) = 4 * n + 8
get_steering_nlin(; n::Integer = default_nvar, kwargs...) = 8
get_steering_nnln(; n::Integer = default_nvar, kwargs...) = 4 * n + 0
get_steering_nequ(; n::Integer = default_nvar, kwargs...) = 4 * n + 7
get_steering_nineq(; n::Integer = default_nvar, kwargs...) = 1
