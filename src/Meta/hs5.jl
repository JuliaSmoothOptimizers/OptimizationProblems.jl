hs5_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs5",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs5_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs5_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs5_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs5_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs5_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs5_nineq(; n::Integer = default_nvar, kwargs...) = 0
