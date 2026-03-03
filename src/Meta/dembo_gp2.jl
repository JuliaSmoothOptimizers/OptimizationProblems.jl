dembo_gp2_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 6,
  :variable_ncon => false,
  :minimize => true,
  :name => "dembo_gp2",
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
get_dembo_gp2_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_dembo_gp2_ncon(; n::Integer = default_nvar, kwargs...) = 6
get_dembo_gp2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp2_nnln(; n::Integer = default_nvar, kwargs...) = 6
get_dembo_gp2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp2_nineq(; n::Integer = default_nvar, kwargs...) = 6
