kirby2_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "kirby2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_kirby2_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_kirby2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_kirby2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_kirby2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_kirby2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_kirby2_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_kirby2_nls_nequ(; n::Integer = default_nvar, kwargs...) = 151
