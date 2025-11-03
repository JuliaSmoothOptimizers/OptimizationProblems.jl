boundary_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "boundary",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
)

get_boundary_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n
get_boundary_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_boundary_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_boundary_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_boundary_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_boundary_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_boundary_nls_nequ(; n::Integer = default_nvar, kwargs...) = 1 * n
