brownbs_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "brownbs",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 9.99998000003e11,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_brownbs_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_brownbs_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_brownbs_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_brownbs_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_brownbs_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_brownbs_nineq(; n::Integer = default_nvar, kwargs...) = 0
