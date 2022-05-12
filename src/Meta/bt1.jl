bt1_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "bt1",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_bt1_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_bt1_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_bt1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_bt1_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_bt1_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_bt1_nineq(; n::Integer = default_nvar, kwargs...) = 0
