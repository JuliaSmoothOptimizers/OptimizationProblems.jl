triangle_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "triangle",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 11.327992479774316,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_triangle_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_triangle_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_triangle_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_triangle_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_triangle_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_triangle_nineq(; n::Integer = default_nvar, kwargs...) = 3
