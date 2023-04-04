palmer2c_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "palmer2c",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.689403430111151e7,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_palmer2c_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_palmer2c_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_palmer2c_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_palmer2c_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_palmer2c_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_palmer2c_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_palmer2c_nls_nequ(; n::Integer = default_nvar, kwargs...) = 23
