robotarm_meta = Dict(
  :nvar => 109,
  :variable_nvar => true,
  :ncon => 102,
  :variable_ncon => true,
  :minimize => true,
  :name => "robotarm",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_robotarm_nvar(; n::Integer = default_nvar, kwargs...) = 9 * (max(2, div(n, 9)) + 1) + 1
get_robotarm_ncon(; n::Integer = default_nvar, kwargs...) =
  3 * (max(2, div(n, 9)) + 1) + 6 * max(2, div(n, 9))
get_robotarm_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_robotarm_nnln(; n::Integer = default_nvar, kwargs...) =
  3 * (max(2, div(n, 9)) + 1) + 6 * max(2, div(n, 9))
get_robotarm_nequ(; n::Integer = default_nvar, kwargs...) = 6 * max(2, div(n, 9))
get_robotarm_nineq(; n::Integer = default_nvar, kwargs...) = 3 * (max(2, div(n, 9)) + 1)
