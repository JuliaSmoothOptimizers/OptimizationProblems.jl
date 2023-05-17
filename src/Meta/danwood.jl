danwood_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "danwood",
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
get_danwood_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_danwood_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_danwood_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_danwood_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_danwood_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_danwood_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_danwood_nls_nequ(; n::Integer = default_nvar, kwargs...) = 6
