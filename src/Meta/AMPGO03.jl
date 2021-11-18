AMPGO03_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "AMPGO03",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.8896081391905737,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_AMPGO03_nvar(; n::Integer = default_nvar, kwargs...) = 1
get_AMPGO03_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO03_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO03_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO03_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO03_nineq(; n::Integer = default_nvar, kwargs...) = 0
