hs98_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs98",
  :has_equalities_only => false,
  :has_inequalities_only => true,
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
get_hs98_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_hs98_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs98_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs98_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_hs98_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs98_nineq(; n::Integer = default_nvar, kwargs...) = 4
