robotarm_meta = Dict(
  :nvar => 280,
  :variable_nvar => false,
  :ncon => 385,
  :variable_ncon => false,
  :minimize => true,
  :name => "robotarm",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_robotarm_nvar(; n::Integer = default_nvar, kwargs...) = 280
get_robotarm_ncon(; n::Integer = default_nvar, kwargs...) = 385
get_robotarm_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_robotarm_nnln(; n::Integer = default_nvar, kwargs...) = 385
get_robotarm_nequ(; n::Integer = default_nvar, kwargs...) = 18
get_robotarm_nineq(; n::Integer = default_nvar, kwargs...) = 367
