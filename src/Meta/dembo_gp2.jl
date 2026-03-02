dembo_gp2_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "dembo_gp2",
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
get_dembo_gp2_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_dembo_gp2_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_dembo_gp2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp2_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_dembo_gp2_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_dembo_gp2_nineq(; n::Integer = default_nvar, kwargs...) = 0
