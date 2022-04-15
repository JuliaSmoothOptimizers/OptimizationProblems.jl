osborne2_meta = Dict(
  :nvar => 11,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "osborne2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.093419514212065,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_osborne2_nvar(; n::Integer = default_nvar, kwargs...) = 11
get_osborne2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_osborne2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_osborne2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_osborne2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_osborne2_nineq(; n::Integer = default_nvar, kwargs...) = 0