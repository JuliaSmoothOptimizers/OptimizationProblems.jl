alsotame_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "alsotame",
  :has_equalities_only => false,
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
get_alsotame_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_alsotame_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_alsotame_nlin(; n::Integer = default_nvar, kwargs...) = 2
get_alsotame_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_alsotame_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_alsotame_nineq(; n::Integer = default_nvar, kwargs...) = 2
