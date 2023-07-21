hs263_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs263",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -1,
  :best_known_upper_bound => -1,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs263_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs263_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs263_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs263_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_hs263_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs263_nineq(; n::Integer = default_nvar, kwargs...) = 2
