rocket_meta = Dict(
  :nvar => 405,
  :variable_nvar => true,
  :ncon => 304,
  :variable_ncon => true,
  :minimize => false,
  :name => "rocket",
  :has_equalities_only => true,
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
get_rocket_nvar(; n::Integer = default_nvar, kwargs...) = 4 * n + 5
get_rocket_ncon(; n::Integer = default_nvar, kwargs...) = 3 * n + 4
get_rocket_nlin(; n::Integer = default_nvar, kwargs...) = 4
get_rocket_nnln(; n::Integer = default_nvar, kwargs...) = 3 * n + 0
get_rocket_nequ(; n::Integer = default_nvar, kwargs...) = 3 * n + 4
get_rocket_nineq(; n::Integer = default_nvar, kwargs...) = 0
