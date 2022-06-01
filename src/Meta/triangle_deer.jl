triangle_deer_meta = Dict(
  :nvar => 2244,
  :variable_nvar => false,
  :ncon => 1896,
  :variable_ncon => false,
  :minimize => true,
  :name => "triangle_deer",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2014.3371645730615,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_triangle_deer_nvar(; n::Integer = default_nvar, kwargs...) = 2244
get_triangle_deer_ncon(; n::Integer = default_nvar, kwargs...) = 1896
get_triangle_deer_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_triangle_deer_nnln(; n::Integer = default_nvar, kwargs...) = 1896
get_triangle_deer_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_triangle_deer_nineq(; n::Integer = default_nvar, kwargs...) = 1896
