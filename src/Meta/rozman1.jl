rozman1_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "rozman1",
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
get_rozman1_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_rozman1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_rozman1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_rozman1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_rozman1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_rozman1_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_rozman1_nls_nequ(; n::Integer = default_nvar, kwargs...) = 25
