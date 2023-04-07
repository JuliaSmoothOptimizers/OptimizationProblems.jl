bdqrtic_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "bdqrtic",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 21696.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_bdqrtic_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_bdqrtic_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_bdqrtic_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_bdqrtic_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_bdqrtic_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_bdqrtic_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_bdqrtic_nls_nequ(; n::Integer = default_nvar, kwargs...) = 2 * (max(5, n) - 4)
