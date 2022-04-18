polygon1_meta = Dict(
  :nvar => 2 * div(default_nvar, 2),
  :variable_nvar => true,
  :ncon => div(default_nvar, 2),
  :variable_ncon => true,
  :minimize => true,
  :name => "polygon1",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => false,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_polygon1_nvar(; n::Integer = default_nvar, kwargs...) = 2 * div(default_nvar, 2)
get_polygon1_ncon(; n::Integer = default_nvar, kwargs...) = div(default_nvar, 2)
get_polygon1_nlin(; n::Integer = default_nvar, kwargs...) = div(default_nvar, 2)
get_polygon1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_polygon1_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_polygon1_nineq(; n::Integer = default_nvar, kwargs...) = div(default_nvar, 2) - 1
