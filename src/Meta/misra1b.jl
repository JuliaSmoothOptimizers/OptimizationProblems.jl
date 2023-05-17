misra1b_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "misra1b",
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
get_misra1b_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_misra1b_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_misra1b_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_misra1b_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_misra1b_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_misra1b_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_misra1b_nls_nequ(; n::Integer = default_nvar, kwargs...) = 14
