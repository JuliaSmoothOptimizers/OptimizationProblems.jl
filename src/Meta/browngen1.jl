browngen1_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "browngen1",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :literature,
)

get_browngen1_nvar(; n::Integer = default_nvar, kwargs...) = max(n, 2)
get_browngen1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_browngen1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_browngen1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_browngen1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_browngen1_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_browngen1_nls_nequ(; n::Integer = default_nvar, kwargs...) = 0
