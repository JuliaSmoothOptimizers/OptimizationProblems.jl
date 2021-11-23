NZF1_meta = Dict(
  :nvar => 91,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "NZF1",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 34698.351903102724,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_NZF1_nvar(; n::Integer = default_nvar, kwargs...) = 13 * max(1, div(n, 13))
get_NZF1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_NZF1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_NZF1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_NZF1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_NZF1_nineq(; n::Integer = default_nvar, kwargs...) = 0
