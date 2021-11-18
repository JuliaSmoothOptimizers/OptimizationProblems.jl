hs106_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 6,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs106",
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
get_hs106_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_hs106_ncon(; n::Integer = default_nvar, kwargs...) = 6
get_hs106_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs106_nnln(; n::Integer = default_nvar, kwargs...) = 6
get_hs106_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs106_nineq(; n::Integer = default_nvar, kwargs...) = 6
