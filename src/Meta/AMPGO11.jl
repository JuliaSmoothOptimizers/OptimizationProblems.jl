AMPGO11_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "AMPGO11",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -1.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_AMPGO11_nvar(; n::Integer = default_nvar, kwargs...) = 1
get_AMPGO11_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO11_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO11_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO11_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO11_nineq(; n::Integer = default_nvar, kwargs...) = 0
