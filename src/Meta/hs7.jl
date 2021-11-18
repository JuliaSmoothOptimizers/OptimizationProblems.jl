hs7_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs7",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs7_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs7_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs7_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs7_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs7_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs7_nineq(; n::Integer = default_nvar, kwargs...) = 0
