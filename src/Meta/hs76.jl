hs76_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs76",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -1.25,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs76_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs76_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs76_nlin(; n::Integer = default_nvar, kwargs...) = 3
get_hs76_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs76_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs76_nineq(; n::Integer = default_nvar, kwargs...) = 3
