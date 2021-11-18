hs114_meta = Dict(
  :nvar => 10,
  :variable_nvar => false,
  :ncon => 11,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs114",
  :has_equalities_only => false,
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
get_hs114_nvar(; n::Integer = default_nvar, kwargs...) = 10
get_hs114_ncon(; n::Integer = default_nvar, kwargs...) = 11
get_hs114_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs114_nnln(; n::Integer = default_nvar, kwargs...) = 11
get_hs114_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs114_nineq(; n::Integer = default_nvar, kwargs...) = 8
