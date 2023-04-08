biggs5_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "biggs5",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -3.156207810643302,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_biggs5_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_biggs5_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_biggs5_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_biggs5_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_biggs5_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_biggs5_nineq(; n::Integer = default_nvar, kwargs...) = 0
