hs93_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs93",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 137.06643718898874,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs93_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_hs93_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs93_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs93_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs93_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs93_nineq(; n::Integer = default_nvar, kwargs...) = 2
