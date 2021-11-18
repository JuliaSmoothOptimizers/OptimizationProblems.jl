hs36_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs36",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -1000.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs36_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs36_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs36_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs36_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs36_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs36_nineq(; n::Integer = default_nvar, kwargs...) = 1
