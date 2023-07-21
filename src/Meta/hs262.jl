hs262_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs262",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -10,
  :best_known_upper_bound => -10,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs262_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs262_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs262_nlin(; n::Integer = default_nvar, kwargs...) = 4
get_hs262_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs262_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs262_nineq(; n::Integer = default_nvar, kwargs...) = 3
