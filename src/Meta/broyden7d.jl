broyden7d_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "broyden7d",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)

get_broyden7d_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_broyden7d_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_broyden7d_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_broyden7d_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_broyden7d_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_broyden7d_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_broyden7d_nls_nequ(; n::Integer = default_nvar, kwargs...) = 0
