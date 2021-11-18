hs75_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs75",
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
get_hs75_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs75_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs75_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs75_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_hs75_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs75_nineq(; n::Integer = default_nvar, kwargs...) = 1
