dembo_gp7_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "dembo_gp7",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :nonlinearly_constrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => missing,
  # Origin: Dembo, Ron S. "A set of geometric programming test problems and their solutions." Mathematical Programming 10.1 (1976): 192-213.
  :origin => :dembo_1976,
)
get_dembo_gp7_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_dembo_gp7_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_dembo_gp7_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dembo_gp7_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_dembo_gp7_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_dembo_gp7_nineq(; n::Integer = default_nvar, kwargs...) = 0
