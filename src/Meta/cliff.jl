cliff_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "cliff",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 4.8516519441069025e8,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_cliff_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_cliff_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_cliff_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_cliff_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_cliff_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_cliff_nineq(; n::Integer = default_nvar, kwargs...) = 0
