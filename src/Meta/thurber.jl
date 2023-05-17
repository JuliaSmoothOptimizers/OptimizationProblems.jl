thurber_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "thurber",
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
get_thurber_nvar(; n::Integer = default_nvar, kwargs...) = 7
get_thurber_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_thurber_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_thurber_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_thurber_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_thurber_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_thurber_nls_nequ(; n::Integer = default_nvar, kwargs...) = 37
