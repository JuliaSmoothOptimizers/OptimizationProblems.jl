AMPGO09_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "AMPGO09",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.9211356000508525,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_AMPGO09_nvar(; n::Integer = default_nvar, kwargs...) = 1
get_AMPGO09_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO09_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO09_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO09_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO09_nineq(; n::Integer = default_nvar, kwargs...) = 0
