camshape_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 203,
  :variable_ncon => true,
  :minimize => true,
  :name => "camshape",
  :has_equalities_only => false,
  :has_inequalities_only => true,
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
get_camshape_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_camshape_ncon(; n::Integer = default_nvar, kwargs...) = 2 * n + 3
get_camshape_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_camshape_nnln(; n::Integer = default_nvar, kwargs...) = 2 * n + 3
get_camshape_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_camshape_nineq(; n::Integer = default_nvar, kwargs...) = 2 * n + 3
