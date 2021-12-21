hs44_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 6,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs44",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs44_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs44_ncon(; n::Integer = default_nvar, kwargs...) = 6
get_hs44_nlin(; n::Integer = default_nvar, kwargs...) = 6
get_hs44_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs44_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs44_nineq(; n::Integer = default_nvar, kwargs...) = 6
