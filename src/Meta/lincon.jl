lincon_meta = Dict(
  :nvar => 15,
  :variable_nvar => false,
  :ncon => 11,
  :variable_ncon => false,
  :minimize => true,
  :name => "lincon",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_lincon_nvar(; n::Integer = default_nvar, kwargs...) = 15
get_lincon_ncon(; n::Integer = default_nvar, kwargs...) = 11
get_lincon_nlin(; n::Integer = default_nvar, kwargs...) = 11
get_lincon_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_lincon_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_lincon_nineq(; n::Integer = default_nvar, kwargs...) = 8
