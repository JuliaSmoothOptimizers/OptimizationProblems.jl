polygon2_meta = Dict(
  :nvar => 2 * div(default_nvar, 2),
  :variable_nvar => true,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "polygon2",
  :has_equalities_only => true,
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
get_polygon2_nvar(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 2)
get_polygon2_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_polygon2_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_polygon2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_polygon2_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_polygon2_nineq(; n::Integer = default_nvar, kwargs...) = 0
