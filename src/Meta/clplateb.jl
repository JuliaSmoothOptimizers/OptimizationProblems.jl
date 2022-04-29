clplateb_meta = Dict(
  :nvar => default_nvar,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "clplateb",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_clplateb_nvar(; n::Integer = default_nvar, kwargs...) = floor(Int, sqrt(n))^2
get_clplateb_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_clplateb_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_clplateb_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_clplateb_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_clplateb_nineq(; n::Integer = default_nvar, kwargs...) = 0
