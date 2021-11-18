zangwil3_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "zangwil3",
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
get_zangwil3_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_zangwil3_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_zangwil3_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_zangwil3_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_zangwil3_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_zangwil3_nineq(; n::Integer = default_nvar, kwargs...) = 0
