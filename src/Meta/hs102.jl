hs102_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs102",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs102_nvar(; n::Integer = default_nvar, kwargs...) = 7
get_hs102_ncon(; n::Integer = default_nvar, kwargs...) = 5
get_hs102_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs102_nnln(; n::Integer = default_nvar, kwargs...) = 5
get_hs102_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs102_nineq(; n::Integer = default_nvar, kwargs...) = 5
