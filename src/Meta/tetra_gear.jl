tetra_gear_meta = Dict(
  :nvar => 2598,
  :variable_nvar => false,
  :ncon => 3116,
  :variable_ncon => false,
  :minimize => true,
  :name => "tetra_gear",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 4256.375736370327,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_tetra_gear_nvar(; n::Integer = default_nvar, kwargs...) = 2598
get_tetra_gear_ncon(; n::Integer = default_nvar, kwargs...) = 3116
get_tetra_gear_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_gear_nnln(; n::Integer = default_nvar, kwargs...) = 3116
get_tetra_gear_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_gear_nineq(; n::Integer = default_nvar, kwargs...) = 3116
