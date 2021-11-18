clplatec_meta = Dict(
  :nvar => 5041,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "clplatec",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_clplatec_nvar(; n::Integer = default_nvar, kwargs...) = 5041
get_clplatec_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_clplatec_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_clplatec_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_clplatec_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_clplatec_nineq(; n::Integer = default_nvar, kwargs...) = 0
