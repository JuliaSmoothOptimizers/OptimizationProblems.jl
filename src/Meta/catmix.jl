catmix_meta = Dict(
  :nvar => 2302,
  :variable_nvar => true,
  :ncon => 2002,
  :variable_ncon => true,
  :minimize => true,
  :name => "catmix",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_catmix_nvar(; n::Integer = default_nvar, kwargs...) = 23 * n + 2
get_catmix_ncon(; n::Integer = default_nvar, kwargs...) = 20 * n + 2
get_catmix_nlin(; n::Integer = default_nvar, kwargs...) = 14 * n + 2
get_catmix_nnln(; n::Integer = default_nvar, kwargs...) = 6 * n + 0
get_catmix_nequ(; n::Integer = default_nvar, kwargs...) = 20 * n + 2
get_catmix_nineq(; n::Integer = default_nvar, kwargs...) = 0
