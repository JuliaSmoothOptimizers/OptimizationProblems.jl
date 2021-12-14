AMPGO13_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "AMPGO13",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -1.5874010519681994, # attained at x=1/sqrt(2)
  :best_known_upper_bound => -1.5874010519681994,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_AMPGO13_nvar(; n::Integer = default_nvar, kwargs...) = 1
get_AMPGO13_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO13_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO13_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO13_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO13_nineq(; n::Integer = default_nvar, kwargs...) = 0
