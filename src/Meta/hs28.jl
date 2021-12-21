hs28_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs28",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 13.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs28_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs28_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs28_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs28_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs28_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs28_nineq(; n::Integer = default_nvar, kwargs...) = 0
