dembo_gp3_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 14,
  :variable_ncon => false,
  :minimize => true,
  :name => "dembo_gp3",
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
get_dembo_gp3_nvar(; n::Integer = default_nvar, kwargs...) = 7
get_dembo_gp3_ncon(; n::Integer = default_nvar, kwargs...) = 14
get_dembo_gp3_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp3_nnln(; n::Integer = default_nvar, kwargs...) = 14
get_dembo_gp3_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp3_nineq(; n::Integer = default_nvar, kwargs...) = 14
