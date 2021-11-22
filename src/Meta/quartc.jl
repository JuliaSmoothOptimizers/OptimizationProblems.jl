quartc_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "quartc",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.85427373e9,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_quartc_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_quartc_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_quartc_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_quartc_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_quartc_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_quartc_nineq(; n::Integer = default_nvar, kwargs...) = 0
