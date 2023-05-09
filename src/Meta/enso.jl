enso_meta = Dict(
  :nvar => 9,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "enso",
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
get_enso_nvar(; n::Integer = default_nvar, kwargs...) = 9
get_enso_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_enso_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_enso_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_enso_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_enso_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_enso_nls_nequ(; n::Integer = default_nvar, kwargs...) = 168
