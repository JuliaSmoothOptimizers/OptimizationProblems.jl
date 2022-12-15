argauss_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 15,
  :variable_ncon => false,
  :minimize => true,
  :name => "argauss",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_argauss_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_argauss_ncon(; n::Integer = default_nvar, kwargs...) = 15
get_argauss_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_argauss_nnln(; n::Integer = default_nvar, kwargs...) = 15
get_argauss_nequ(; n::Integer = default_nvar, kwargs...) = 15
get_argauss_nineq(; n::Integer = default_nvar, kwargs...) = 0
