hs74_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs74",
  :has_equalities_only => false,
  :has_inequalities_only => false,
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
get_hs74_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs74_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs74_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs74_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_hs74_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs74_nineq(; n::Integer = default_nvar, kwargs...) = 1
