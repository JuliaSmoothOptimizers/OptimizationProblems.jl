gasoil_meta = Dict(
  :nvar => 2603,
  :variable_nvar => true,
  :ncon => 2600,
  :variable_ncon => true,
  :minimize => true,
  :name => "gasoil",
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
get_gasoil_nvar(; n::Integer = default_nvar, kwargs...) = 26 * n + 3
get_gasoil_ncon(; n::Integer = default_nvar, kwargs...) = 26 * n + 0
get_gasoil_nlin(; n::Integer = default_nvar, kwargs...) = 18 * n + 0
get_gasoil_nnln(; n::Integer = default_nvar, kwargs...) = 8 * n + 0
get_gasoil_nequ(; n::Integer = default_nvar, kwargs...) = 26 * n + 0
get_gasoil_nineq(; n::Integer = default_nvar, kwargs...) = 0
