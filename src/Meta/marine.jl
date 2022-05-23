marine_meta = Dict(
  :nvar => 352,
  :variable_nvar => false,
  :ncon => 322,
  :variable_ncon => false,
  :minimize => true,
  :name => "marine",
  :has_equalities_only => false,
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
get_marine_nvar(; n::Integer = default_nvar, kwargs...) = 352
get_marine_ncon(; n::Integer = default_nvar, kwargs...) = 322
get_marine_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_marine_nnln(; n::Integer = default_nvar, kwargs...) = 322
get_marine_nequ(; n::Integer = default_nvar, kwargs...) = 314
get_marine_nineq(; n::Integer = default_nvar, kwargs...) = 8
