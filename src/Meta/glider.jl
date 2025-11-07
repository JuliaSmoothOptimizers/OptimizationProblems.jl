glider_meta = Dict(
  :nvar => 506,
  :variable_nvar => true,
  :ncon => 407,
  :variable_ncon => true,
  :minimize => false,
  :name => "glider",
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
get_glider_nvar(; n::Integer = default_nvar, kwargs...) = 5 * n + 6
get_glider_ncon(; n::Integer = default_nvar, kwargs...) = 4 * n + 7
get_glider_nlin(; n::Integer = default_nvar, kwargs...) = 7
get_glider_nnln(; n::Integer = default_nvar, kwargs...) = 4 * n + 0
get_glider_nequ(; n::Integer = default_nvar, kwargs...) = 4 * n + 7
get_glider_nineq(; n::Integer = default_nvar, kwargs...) = 0
