aircrfta_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "aircrfta",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_aircrfta_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_aircrfta_ncon(; n::Integer = default_nvar, kwargs...) = 5
get_aircrfta_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_aircrfta_nnln(; n::Integer = default_nvar, kwargs...) = 5
get_aircrfta_nequ(; n::Integer = default_nvar, kwargs...) = 5
get_aircrfta_nineq(; n::Integer = default_nvar, kwargs...) = 0
