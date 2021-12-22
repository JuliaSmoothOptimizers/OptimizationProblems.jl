hs24_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs24",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.013364589564574673,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs24_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs24_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs24_nlin(; n::Integer = default_nvar, kwargs...) = 2
get_hs24_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs24_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs24_nineq(; n::Integer = default_nvar, kwargs...) = 2
