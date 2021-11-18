hs32_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs32",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 7.199999999999999,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs32_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs32_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs32_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs32_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs32_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs32_nineq(; n::Integer = default_nvar, kwargs...) = 1
