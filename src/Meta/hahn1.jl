hahn1_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hahn1",
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
get_hahn1_nvar(; n::Integer = default_nvar, kwargs...) = 7
get_hahn1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hahn1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hahn1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hahn1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hahn1_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_hahn1_nls_nequ(; n::Integer = default_nvar, kwargs...) = 236
