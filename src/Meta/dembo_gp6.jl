dembo_gp6_meta = Dict(
  :nvar => 13,
  :variable_nvar => false,
  :ncon => 13,
  :variable_ncon => false,
  :minimize => true,
  :name => "dembo_gp6",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :linear,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => false,
  :origin => :academic,
)
get_dembo_gp6_nvar(; n::Integer = default_nvar, kwargs...) = 13
get_dembo_gp6_ncon(; n::Integer = default_nvar, kwargs...) = 13
get_dembo_gp6_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp6_nnln(; n::Integer = default_nvar, kwargs...) = 13
get_dembo_gp6_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp6_nineq(; n::Integer = default_nvar, kwargs...) = 13
