avion2_meta = Dict(
  :nvar => 49,
  :variable_nvar => false,
  :ncon => 15,
  :variable_ncon => false,
  :minimize => true,
  :name => "avion2",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_avion2_nvar(; n::Integer = default_nvar, kwargs...) = 49
get_avion2_ncon(; n::Integer = default_nvar, kwargs...) = 15
get_avion2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_avion2_nnln(; n::Integer = default_nvar, kwargs...) = 15
get_avion2_nequ(; n::Integer = default_nvar, kwargs...) = 15
get_avion2_nineq(; n::Integer = default_nvar, kwargs...) = 0
