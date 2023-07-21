hs237_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs237",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -58.9034,
  :best_known_upper_bound => -58.9034,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs237_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs237_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs237_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs237_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs237_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs237_nineq(; n::Integer = default_nvar, kwargs...) = 3
