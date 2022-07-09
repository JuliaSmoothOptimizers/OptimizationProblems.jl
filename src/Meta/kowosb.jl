kowosb_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "kowosb",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.026497849149796696,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_kowosb_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_kowosb_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_kowosb_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_kowosb_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_kowosb_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_kowosb_nineq(; n::Integer = default_nvar, kwargs...) = 0
