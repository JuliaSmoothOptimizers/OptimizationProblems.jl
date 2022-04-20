mgh01feas_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "mgh01feas",
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
get_mgh01feas_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_mgh01feas_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_mgh01feas_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_mgh01feas_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_mgh01feas_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_mgh01feas_nineq(; n::Integer = default_nvar, kwargs...) = 0
