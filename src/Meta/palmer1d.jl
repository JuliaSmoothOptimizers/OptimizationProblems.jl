palmer1d_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "palmer1d",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.872664926620958e7,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_palmer1d_nvar(; n::Integer = default_nvar, kwargs...) = 7
get_palmer1d_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_palmer1d_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_palmer1d_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_palmer1d_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_palmer1d_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_palmer1d_nls_nequ(; n::Integer = default_nvar, kwargs...) = 35
