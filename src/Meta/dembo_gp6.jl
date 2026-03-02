dembo_gp6_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "dembo_gp6",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
)
get_dembo_gp6_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_dembo_gp6_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_dembo_gp6_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp6_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_dembo_gp6_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_dembo_gp6_nineq(; n::Integer = default_nvar, kwargs...) = 0
