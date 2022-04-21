hovercraft1d_meta = Dict(
  :nvar => 3 * div(default_nvar, 3) - 1,
  :variable_nvar => true,
  :ncon => 2 * div(default_nvar, 3) + 2,
  :variable_ncon => true,
  :minimize => true,
  :name => "hovercraft1d",
  :has_equalities_only => true,
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
get_hovercraft1d_nvar(; n::Integer = default_nvar, kwargs...) = 3 * div(n, 3) - 1
get_hovercraft1d_ncon(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 3) + 2
get_hovercraft1d_nlin(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 3) + 2
get_hovercraft1d_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hovercraft1d_nequ(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 3) + 2
get_hovercraft1d_nineq(; n::Integer = default_nvar, kwargs...) = 0
