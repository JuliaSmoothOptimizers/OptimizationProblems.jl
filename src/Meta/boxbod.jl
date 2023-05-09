boxbod_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "boxbod",
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
get_boxbod_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_boxbod_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_boxbod_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_boxbod_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_boxbod_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_boxbod_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_boxbod_nls_nequ(; n::Integer = default_nvar, kwargs...) = 6
