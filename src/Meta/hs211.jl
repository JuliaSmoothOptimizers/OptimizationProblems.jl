hs211_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs211",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 750.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs211_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs211_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs211_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs211_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs211_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs211_nineq(; n::Integer = default_nvar, kwargs...) = 0
