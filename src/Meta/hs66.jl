hs66_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs66",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.58,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs66_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs66_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs66_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs66_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs66_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs66_nineq(; n::Integer = default_nvar, kwargs...) = 2
