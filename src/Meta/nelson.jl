nelson_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "nelson",
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
get_nelson_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_nelson_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_nelson_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_nelson_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_nelson_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_nelson_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_nelson_nls_nequ(; n::Integer = default_nvar, kwargs...) = 128
