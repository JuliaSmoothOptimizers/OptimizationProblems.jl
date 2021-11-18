hs86_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 10,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs86",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 20.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs86_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs86_ncon(; n::Integer = default_nvar, kwargs...) = 10
get_hs86_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs86_nnln(; n::Integer = default_nvar, kwargs...) = 10
get_hs86_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs86_nineq(; n::Integer = default_nvar, kwargs...) = 10
