dembo_gp8a_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "dembo_gp8a",
  :has_equalities_only => false,
  :has_inequalities_only => true,
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
get_dembo_gp8a_nvar(; n::Integer = default_nvar, kwargs...) = 7
get_dembo_gp8a_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_dembo_gp8a_nlin(; n::Integer = default_nvar, kwargs...) = 4
get_dembo_gp8a_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp8a_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp8a_nineq(; n::Integer = default_nvar, kwargs...) = 4
