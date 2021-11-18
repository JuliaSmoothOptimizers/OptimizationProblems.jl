hs73_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs73",
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
get_hs73_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs73_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs73_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs73_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs73_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs73_nineq(; n::Integer = default_nvar, kwargs...) = 2
