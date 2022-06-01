triangle_pac_meta = Dict(
  :nvar => 1366,
  :variable_nvar => false,
  :ncon => 1182,
  :variable_ncon => false,
  :minimize => true,
  :name => "triangle_pac",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1316.282216286999,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_triangle_pac_nvar(; n::Integer = default_nvar, kwargs...) = 1366
get_triangle_pac_ncon(; n::Integer = default_nvar, kwargs...) = 1182
get_triangle_pac_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_triangle_pac_nnln(; n::Integer = default_nvar, kwargs...) = 1182
get_triangle_pac_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_triangle_pac_nineq(; n::Integer = default_nvar, kwargs...) = 1182
