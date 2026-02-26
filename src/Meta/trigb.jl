trigb_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "trigb",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2404.778982861876,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)

get_trigb_nvar(; n::Integer = default_nvar, kwargs...) = n
get_trigb_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_trigb_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_trigb_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_trigb_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_trigb_nineq(; n::Integer = default_nvar, kwargs...) = 0
