hs104_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs104",
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
get_hs104_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_hs104_ncon(; n::Integer = default_nvar, kwargs...) = 5
get_hs104_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs104_nnln(; n::Integer = default_nvar, kwargs...) = 5
get_hs104_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs104_nineq(; n::Integer = default_nvar, kwargs...) = 5
