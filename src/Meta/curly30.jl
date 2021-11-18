curly30_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "curly30",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.02038297204649621,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_curly30_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_curly30_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_curly30_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_curly30_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_curly30_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_curly30_nineq(; n::Integer = default_nvar, kwargs...) = 0
