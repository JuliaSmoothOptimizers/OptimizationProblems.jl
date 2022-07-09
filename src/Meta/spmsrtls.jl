spmsrtls_meta = Dict(
  :nvar => max(Int(round((default_nvar + 2) / 3)), 34) * 3 - 2,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "spmsrtls",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 49.32387140878785,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_spmsrtls_nvar(; n::Integer = default_nvar, kwargs...) = max(Int(round((n + 2) / 3)), 34) * 3 - 2
get_spmsrtls_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_spmsrtls_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_spmsrtls_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_spmsrtls_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_spmsrtls_nineq(; n::Integer = default_nvar, kwargs...) = 0
