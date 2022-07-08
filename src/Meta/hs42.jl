hs42_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs42",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs42_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs42_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs42_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs42_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs42_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs42_nineq(; n::Integer = default_nvar, kwargs...) = 0
