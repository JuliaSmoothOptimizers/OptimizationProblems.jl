mgh10_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "mgh10",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => false,
  :origin => :academic,
)
get_mgh10_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_mgh10_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_mgh10_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_mgh10_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_mgh10_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_mgh10_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_mgh10_nls_nequ(; n::Integer = default_nvar, kwargs...) = 16
