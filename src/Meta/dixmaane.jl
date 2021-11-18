dixmaane_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixmaane",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 731.8333333333334,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_dixmaane_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + -2
get_dixmaane_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaane_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaane_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaane_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaane_nineq(; n::Integer = default_nvar, kwargs...) = 0
