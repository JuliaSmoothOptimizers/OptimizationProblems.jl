dembo_gp7_meta = Dict(
  :nvar => 16,
  :variable_nvar => false,
  :ncon => 19,
  :variable_ncon => false,
  :minimize => true,
  :name => "dembo_gp7",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => false,
  :origin => :academic,
)
get_dembo_gp7_nvar(; n::Integer = default_nvar, kwargs...) = 16
get_dembo_gp7_ncon(; n::Integer = default_nvar, kwargs...) = 19
get_dembo_gp7_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp7_nnln(; n::Integer = default_nvar, kwargs...) = 19
get_dembo_gp7_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp7_nineq(; n::Integer = default_nvar, kwargs...) = 19
