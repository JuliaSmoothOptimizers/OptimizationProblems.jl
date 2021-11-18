hs25_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs25",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 32.834999999663594,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs25_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs25_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs25_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs25_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs25_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs25_nineq(; n::Integer = default_nvar, kwargs...) = 0
