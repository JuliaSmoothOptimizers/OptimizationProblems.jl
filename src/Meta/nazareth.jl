nazareth_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "nazareth",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :literature,
)

get_nazareth_nvar(; n::Integer = default_nvar, kwargs...) = n
get_nazareth_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_nazareth_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_nazareth_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_nazareth_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_nazareth_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_nazareth_nls_nequ(; n::Integer = default_nvar, kwargs...) = n
