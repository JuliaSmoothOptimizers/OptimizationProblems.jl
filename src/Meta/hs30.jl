hs30_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs30",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 3.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs30_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs30_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs30_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs30_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs30_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs30_nineq(; n::Integer = default_nvar, kwargs...) = 1
