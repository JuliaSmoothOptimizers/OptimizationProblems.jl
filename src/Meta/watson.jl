watson_meta = Dict(
  :nvar => 31,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "watson",
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
get_watson_nvar(; n::Integer = default_nvar, kwargs...) = min(max(n, 2), 31)
get_watson_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_watson_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_watson_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_watson_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_watson_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_watson_nls_nequ(; n::Integer = default_nvar, kwargs...) = 31
