chain_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 77,
  :variable_ncon => true,
  :minimize => true,
  :name => "chain",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_chain_nvar(; n::Integer = default_nvar, kwargs...) = 4 * (max(2, div(n - 4, 4)) + 1)
get_chain_ncon(; n::Integer = default_nvar, kwargs...) = 3 * max(2, div(n - 4, 4)) + 5
get_chain_nlin(; n::Integer = default_nvar, kwargs...) = max(2, div(n - 4, 4)) + 5
get_chain_nnln(; n::Integer = default_nvar, kwargs...) = 2 * max(2, div(n - 4, 4))
get_chain_nequ(; n::Integer = default_nvar, kwargs...) = 3 * max(2, div(n - 4, 4)) + 5
get_chain_nineq(; n::Integer = default_nvar, kwargs...) = 0
