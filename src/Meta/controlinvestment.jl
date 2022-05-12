controlinvestment_meta = Dict(
  :nvar => 2 * div(default_nvar, 2),
  :variable_nvar => true,
  :ncon => div(default_nvar, 2),
  :variable_ncon => true,
  :minimize => true,
  :name => "controlinvestment",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.98,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_controlinvestment_nvar(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 2)
get_controlinvestment_ncon(; n::Integer = default_nvar, kwargs...) = div(n, 2)
get_controlinvestment_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_controlinvestment_nnln(; n::Integer = default_nvar, kwargs...) = div(n, 2) - 1
get_controlinvestment_nequ(; n::Integer = default_nvar, kwargs...) = div(n, 2)
get_controlinvestment_nineq(; n::Integer = default_nvar, kwargs...) = 0
