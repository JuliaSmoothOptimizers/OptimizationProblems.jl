dixmaanh_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixmaanh",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 4974.253333333338,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_dixmaanh_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + -2
get_dixmaanh_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanh_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanh_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanh_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaanh_nineq(; n::Integer = default_nvar, kwargs...) = 0
