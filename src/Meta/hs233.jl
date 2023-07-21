hs233_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs233",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => 0,
  :best_known_upper_bound => 0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs233_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs233_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs233_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs233_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs233_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs233_nineq(; n::Integer = default_nvar, kwargs...) = 1
