hs43_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs43",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs43_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs43_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs43_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs43_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs43_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs43_nineq(; n::Integer = default_nvar, kwargs...) = 3
