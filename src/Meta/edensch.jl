edensch_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "edensch",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1699.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_edensch_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_edensch_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_edensch_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_edensch_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_edensch_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_edensch_nineq(; n::Integer = default_nvar, kwargs...) = 0
