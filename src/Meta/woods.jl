woods_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "woods",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 180451.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_woods_nvar(; n::Integer = default_nvar, kwargs...) = 4 * max(1, div(n, 4))  # number of variables adjusted to be a multiple of 4
get_woods_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_woods_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_woods_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_woods_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_woods_nineq(; n::Integer = default_nvar, kwargs...) = 0
