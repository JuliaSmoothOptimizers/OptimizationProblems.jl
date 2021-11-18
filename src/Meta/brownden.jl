brownden_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "brownden",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 7.926693336997432e6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_brownden_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_brownden_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_brownden_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_brownden_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_brownden_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_brownden_nineq(; n::Integer = default_nvar, kwargs...) = 0
