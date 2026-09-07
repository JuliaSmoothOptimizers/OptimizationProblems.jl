hs85_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 38,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs85",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -1.90513375,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs85_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs85_ncon(; n::Integer = default_nvar, kwargs...) = 38
get_hs85_nlin(; n::Integer = default_nvar, kwargs...) = 3
get_hs85_nnln(; n::Integer = default_nvar, kwargs...) = 35
get_hs85_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs85_nineq(; n::Integer = default_nvar, kwargs...) = 38
