genrose_nash_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "genrose_nash",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 404.12622137598714,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_genrose_nash_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_genrose_nash_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nash_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nash_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nash_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nash_nineq(; n::Integer = default_nvar, kwargs...) = 0
