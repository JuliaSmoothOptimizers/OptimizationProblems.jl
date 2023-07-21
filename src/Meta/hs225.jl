hs225_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs225",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => 2,
  :best_known_upper_bound => 2,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs225_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs225_ncon(; n::Integer = default_nvar, kwargs...) = 5
get_hs225_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs225_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_hs225_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs225_nineq(; n::Integer = default_nvar, kwargs...) = 5
