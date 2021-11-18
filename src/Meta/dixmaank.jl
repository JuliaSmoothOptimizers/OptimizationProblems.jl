dixmaank_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixmaank",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2427.645903479237,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_dixmaank_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + -2
get_dixmaank_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaank_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaank_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaank_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaank_nineq(; n::Integer = default_nvar, kwargs...) = 0
