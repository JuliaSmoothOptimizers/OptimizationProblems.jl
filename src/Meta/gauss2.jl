gauss2_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "gauss2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_gauss2_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_gauss2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_gauss2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_gauss2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_gauss2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_gauss2_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_gauss2_nls_nequ(; n::Integer = default_nvar, kwargs...) = 250
