eckerle4_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "eckerle4",
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
get_eckerle4_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_eckerle4_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_eckerle4_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_eckerle4_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_eckerle4_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_eckerle4_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_eckerle4_nls_nequ(; n::Integer = default_nvar, kwargs...) = 35
