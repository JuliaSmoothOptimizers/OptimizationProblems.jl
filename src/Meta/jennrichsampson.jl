jennrichsampson_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "jennrichsampson",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 4171.306161960493,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_jennrichsampson_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_jennrichsampson_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_jennrichsampson_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_jennrichsampson_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_jennrichsampson_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_jennrichsampson_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_jennrichsampson_nls_nequ(; n::Integer = default_nvar, m::Int = 10, kwargs...) = m
