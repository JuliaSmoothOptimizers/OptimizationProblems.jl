
osborne1_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "osborne1",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 7.068755591027714,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_osborne1_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_osborne1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_osborne1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_osborne1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_osborne1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_osborne1_nineq(; n::Integer = default_nvar, kwargs...) = 0
