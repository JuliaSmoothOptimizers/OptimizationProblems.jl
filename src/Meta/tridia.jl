tridia_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "tridia",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 5049.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_tridia_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_tridia_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_tridia_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_tridia_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_tridia_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_tridia_nineq(; n::Integer = default_nvar, kwargs...) = 0
