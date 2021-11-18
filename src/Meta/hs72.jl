hs72_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs72",
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
get_hs72_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs72_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs72_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs72_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs72_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs72_nineq(; n::Integer = default_nvar, kwargs...) = 2
