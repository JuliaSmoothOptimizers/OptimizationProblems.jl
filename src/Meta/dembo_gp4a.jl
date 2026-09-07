dembo_gp4a_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "dembo_gp4a",
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
get_dembo_gp4a_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_dembo_gp4a_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_dembo_gp4a_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp4a_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_dembo_gp4a_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp4a_nineq(; n::Integer = default_nvar, kwargs...) = 4
