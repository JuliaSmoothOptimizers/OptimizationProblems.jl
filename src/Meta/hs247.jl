hs247_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs247",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => 0,
  :best_known_upper_bound => 0,
  :is_feasible => true,
  :defined_everywhere => false,
  :origin => :unknown,
)
get_hs247_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs247_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs247_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs247_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs247_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs247_nineq(; n::Integer = default_nvar, kwargs...) = 0
