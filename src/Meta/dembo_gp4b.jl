dembo_gp4b_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "dembo_gp4b",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
)
get_dembo_gp4b_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_dembo_gp4b_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_dembo_gp4b_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_dembo_gp4b_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp4b_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_dembo_gp4b_nineq(; n::Integer = default_nvar, kwargs...) = 0
