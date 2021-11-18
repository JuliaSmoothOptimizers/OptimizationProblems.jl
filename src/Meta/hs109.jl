hs109_meta = Dict(
  :nvar => 9,
  :variable_nvar => false,
  :ncon => 9,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs109",
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
get_hs109_nvar(; n::Integer = default_nvar, kwargs...) = 9
get_hs109_ncon(; n::Integer = default_nvar, kwargs...) = 9
get_hs109_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs109_nnln(; n::Integer = default_nvar, kwargs...) = 9
get_hs109_nequ(; n::Integer = default_nvar, kwargs...) = 6
get_hs109_nineq(; n::Integer = default_nvar, kwargs...) = 3
