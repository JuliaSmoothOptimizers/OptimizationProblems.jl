pinene_meta = Dict(
  :nvar => 5005,
  :variable_nvar => true,
  :ncon => 5000,
  :variable_ncon => true,
  :minimize => true,
  :name => "pinene",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_pinene_nvar(; n::Integer = default_nvar, kwargs...) = 50 * n + 5
get_pinene_ncon(; n::Integer = default_nvar, kwargs...) = 50 * n + 0
get_pinene_nlin(; n::Integer = default_nvar, kwargs...) = 35 * n + 0
get_pinene_nnln(; n::Integer = default_nvar, kwargs...) = 15 * n + 0
get_pinene_nequ(; n::Integer = default_nvar, kwargs...) = 50 * n + 0
get_pinene_nineq(; n::Integer = default_nvar, kwargs...) = 0
