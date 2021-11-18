nasty_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "nasty",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.5,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_nasty_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_nasty_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_nasty_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_nasty_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_nasty_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_nasty_nineq(; n::Integer = default_nvar, kwargs...) = 0
