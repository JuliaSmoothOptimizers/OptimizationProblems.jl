clnlbeam_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 64,
  :variable_ncon => true,
  :minimize => true,
  :name => "clnlbeam",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 350.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_clnlbeam_nvar(; n::Integer = default_nvar, kwargs...) = 3 * div(n - 3, 3) + 3
get_clnlbeam_ncon(; n::Integer = default_nvar, kwargs...) = 2 * div(n - 3, 3)
get_clnlbeam_nlin(; n::Integer = default_nvar, kwargs...) = div(n - 3, 3)
get_clnlbeam_nnln(; n::Integer = default_nvar, kwargs...) = div(n - 3, 3)
get_clnlbeam_nequ(; n::Integer = default_nvar, kwargs...) = 2 * div(n - 3, 3)
get_clnlbeam_nineq(; n::Integer = default_nvar, kwargs...) = 0