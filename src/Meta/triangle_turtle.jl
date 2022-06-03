triangle_turtle_meta = Dict(
  :nvar => 4444,
  :variable_nvar => false,
  :ncon => 4025,
  :variable_ncon => false,
  :minimize => true,
  :name => "triangle_turtle",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 4467.578651857072,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_triangle_turtle_nvar(; n::Integer = default_nvar, kwargs...) = 4444
get_triangle_turtle_ncon(; n::Integer = default_nvar, kwargs...) = 4025
get_triangle_turtle_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_triangle_turtle_nnln(; n::Integer = default_nvar, kwargs...) = 4025
get_triangle_turtle_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_triangle_turtle_nineq(; n::Integer = default_nvar, kwargs...) = 4025
