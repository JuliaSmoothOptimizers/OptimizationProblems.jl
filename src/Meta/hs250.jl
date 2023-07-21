hs250_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs250",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -3300,
  :best_known_upper_bound => -3300,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs250_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs250_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs250_nlin(; n::Integer = default_nvar, kwargs...) = 2
get_hs250_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs250_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs250_nineq(; n::Integer = default_nvar, kwargs...) = 2
