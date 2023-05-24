bearing_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "bearing",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 15.066210503336873,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_bearing_nvar(;
  n::Integer = default_nvar,
  nx::Int = Int(round(sqrt(max(n, 1)))) - 2,
  ny::Int = Int(round(sqrt(max(n, 1)))) - 2,
  kwargs...,
) = (nx + 2) * (ny + 2)
get_bearing_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_bearing_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_bearing_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_bearing_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_bearing_nineq(; n::Integer = default_nvar, kwargs...) = 0
