chwirut1_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "chwirut1",
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
get_chwirut1_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_chwirut1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_chwirut1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_chwirut1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_chwirut1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_chwirut1_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_chwirut1_nls_nequ(; n::Integer = default_nvar, kwargs...) = 214
