hs41_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs41",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs41_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs41_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs41_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs41_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs41_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs41_nineq(; n::Integer = default_nvar, kwargs...) = 0
