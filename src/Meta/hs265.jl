hs265_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs265",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => 1 - exp(-10 * exp(-1)),
  :best_known_upper_bound => 1 - exp(-10 * exp(-1)),
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs265_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs265_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs265_nlin(; n::Integer = default_nvar, kwargs...) = 2
get_hs265_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs265_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs265_nineq(; n::Integer = default_nvar, kwargs...) = 0
