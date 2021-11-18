AMPGO04_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "AMPGO04",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -2.5665975058604182,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_AMPGO04_nvar(; n::Integer = default_nvar, kwargs...) = 1
get_AMPGO04_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO04_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO04_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO04_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO04_nineq(; n::Integer = default_nvar, kwargs...) = 0
