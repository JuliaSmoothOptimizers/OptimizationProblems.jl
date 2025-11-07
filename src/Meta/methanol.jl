methanol_meta = Dict(
  :nvar => 3005,
  :variable_nvar => true,
  :ncon => 3000,
  :variable_ncon => true,
  :minimize => true,
  :name => "methanol",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_methanol_nvar(; n::Integer = default_nvar, kwargs...) = 30 * n + 5
get_methanol_ncon(; n::Integer = default_nvar, kwargs...) = 30 * n + 0
get_methanol_nlin(; n::Integer = default_nvar, kwargs...) = 21 * n + 0
get_methanol_nnln(; n::Integer = default_nvar, kwargs...) = 9 * n + 0
get_methanol_nequ(; n::Integer = default_nvar, kwargs...) = 30 * n + 0
get_methanol_nineq(; n::Integer = default_nvar, kwargs...) = 0
