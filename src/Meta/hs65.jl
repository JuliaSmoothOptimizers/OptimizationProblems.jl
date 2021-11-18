hs65_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs65",
  :has_equalities_only => false,
  :has_inequalities_only => true,
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
get_hs65_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs65_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs65_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs65_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs65_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs65_nineq(; n::Integer = default_nvar, kwargs...) = 1
