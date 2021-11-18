hs45_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs45",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.7333333333333334,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs45_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs45_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs45_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs45_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs45_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs45_nineq(; n::Integer = default_nvar, kwargs...) = 0
