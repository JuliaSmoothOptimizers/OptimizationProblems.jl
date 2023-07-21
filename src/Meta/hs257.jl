hs257_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs257",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => 0,
  :best_known_upper_bound => 0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs257_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs257_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs257_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs257_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs257_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs257_nineq(; n::Integer = default_nvar, kwargs...) = 0
