hs89_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs89",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.36265681,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs89_nvar(; n::Integer = 3, kwargs...) = 3
get_hs89_ncon(; n::Integer = 1, kwargs...) = 1
get_hs89_nlin(; n::Integer = 1, kwargs...) = 0
get_hs89_nnln(; n::Integer = 1, kwargs...) = 1
