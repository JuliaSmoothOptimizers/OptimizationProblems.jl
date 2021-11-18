hs9_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs9",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs9_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs9_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs9_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs9_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs9_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs9_nineq(; n::Integer = default_nvar, kwargs...) = 0
