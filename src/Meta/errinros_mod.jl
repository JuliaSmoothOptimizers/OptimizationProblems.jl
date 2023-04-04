errinros_mod_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "errinros_mod",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 313991.29345132335,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_errinros_mod_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_errinros_mod_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_errinros_mod_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_errinros_mod_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_errinros_mod_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_errinros_mod_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_errinros_nls_nequ(; n::Integer = default_nvar, kwargs...) = 2 * (n - 1)
