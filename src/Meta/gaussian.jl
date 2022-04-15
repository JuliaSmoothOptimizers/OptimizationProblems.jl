gaussian_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "gaussian",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_gaussian_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_gaussian_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_gaussian_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_gaussian_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_gaussian_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_gaussian_nineq(; n::Integer = default_nvar, kwargs...) = 0
