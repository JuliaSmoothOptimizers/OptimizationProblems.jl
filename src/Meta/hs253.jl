hs253_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs253",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => 87.3794,
  :best_known_upper_bound => 87.3794,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs253_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs253_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs253_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs253_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs253_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs253_nineq(; n::Integer = default_nvar, kwargs...) = 1
