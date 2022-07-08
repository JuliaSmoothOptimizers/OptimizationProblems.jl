hs52_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs52",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs52_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs52_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs52_nlin(; n::Integer = default_nvar, kwargs...) = 3
get_hs52_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs52_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs52_nineq(; n::Integer = default_nvar, kwargs...) = 0
