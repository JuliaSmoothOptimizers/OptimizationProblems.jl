chainwoo_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "chainwoo",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 371954.1,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_chainwoo_nvar(; n::Integer = default_nvar, kwargs...) = 4 * max(1, div(n, 4))
get_chainwoo_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nls_nequ(; n::Integer = default_nvar, kwargs...) = 4 * max(1, div(n, 4))
