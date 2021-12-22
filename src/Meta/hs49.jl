hs49_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs49",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 266.000064,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs49_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs49_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs49_nlin(; n::Integer = default_nvar, kwargs...) = 2
get_hs49_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs49_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs49_nineq(; n::Integer = default_nvar, kwargs...) = 0
