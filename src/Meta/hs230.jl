hs230_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs230",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => 0.375,
  :best_known_upper_bound => 0.375,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs230_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs230_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs230_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs230_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs230_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs230_nineq(; n::Integer = default_nvar, kwargs...) = 2
