hs26_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs26",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 21.159999999999997,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs26_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs26_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs26_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs26_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs26_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs26_nineq(; n::Integer = default_nvar, kwargs...) = 0
