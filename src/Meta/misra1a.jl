misra1a_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "misra1a",
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
get_misra1a_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_misra1a_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_misra1a_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_misra1a_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_misra1a_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_misra1a_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_misra1a_nls_nequ(; n::Integer = default_nvar, kwargs...) = 14
