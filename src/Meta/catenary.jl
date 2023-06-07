catenary_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 32,
  :variable_ncon => true,
  :minimize => true,
  :name => "catenary",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :linear,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :academic,
)
get_catenary_nvar(; n::Integer = default_nvar, kwargs...) = max(9,3 * max(1, div(n, 3)))  
get_catenary_ncon(; n::Integer = default_nvar, kwargs...) = max(3, max(1, div(n, 3)))-1
get_catenary_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_catenary_nnln(; n::Integer = default_nvar, kwargs...) = max(3, max(1, div(n, 3)))-1
get_catenary_nequ(; n::Integer = default_nvar, kwargs...) = max(3, max(1, div(n, 3)))-1
get_catenary_nineq(; n::Integer = default_nvar, kwargs...) = 0
