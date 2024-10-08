hs252_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs252",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => 0.04,
  :best_known_upper_bound => 0.04,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs252_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs252_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs252_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs252_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs252_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs252_nineq(; n::Integer = default_nvar, kwargs...) = 0
