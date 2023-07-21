hs220_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs220",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => 1,
  :best_known_upper_bound => 25000,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs220_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs220_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs220_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs220_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs220_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs220_nineq(; n::Integer = default_nvar, kwargs...) = 0
