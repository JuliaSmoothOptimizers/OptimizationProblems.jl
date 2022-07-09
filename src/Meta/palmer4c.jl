palmer4c_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "palmer4c",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 8.094447597223963e6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_palmer4c_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_palmer4c_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_palmer4c_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_palmer4c_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_palmer4c_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_palmer4c_nineq(; n::Integer = default_nvar, kwargs...) = 0
