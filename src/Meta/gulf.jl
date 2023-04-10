gulf_meta = Dict(
  :nvar => 3,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "gulf",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_gulf_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_gulf_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_gulf_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_gulf_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_gulf_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_gulf_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_gulf_nls_nequ(; n::Integer = default_nvar, m = 100, kwargs...) = m
