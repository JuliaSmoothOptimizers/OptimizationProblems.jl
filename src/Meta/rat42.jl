rat42_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "rat42",
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
get_rat42_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_rat42_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_rat42_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_rat42_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_rat42_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_rat42_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_rat42_nls_nequ(; n::Integer = default_nvar, kwargs...) = 9
