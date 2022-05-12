hs59_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs59",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs59_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs59_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs59_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs59_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs59_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs59_nineq(; n::Integer = default_nvar, kwargs...) = 3
