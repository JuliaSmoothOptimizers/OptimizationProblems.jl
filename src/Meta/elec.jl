elec_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 33,
  :variable_ncon => true,
  :minimize => true,
  :name => "elec",
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
get_elec_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + -2
get_elec_ncon(; n::Integer = default_nvar, kwargs...) = 0 * n + 16
get_elec_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_elec_nnln(; n::Integer = default_nvar, kwargs...) = 0 * n + 16
get_elec_nequ(; n::Integer = default_nvar, kwargs...) = 0 * n + 16
get_elec_nineq(; n::Integer = default_nvar, kwargs...) = 0
