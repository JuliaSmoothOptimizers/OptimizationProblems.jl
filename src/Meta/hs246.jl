hs246_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs246",
  :has_equalities_only => false,
  :has_inequalities_only => false,
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
get_hs246_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs246_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs246_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs246_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs246_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs246_nineq(; n::Integer = default_nvar, kwargs...) = 0
