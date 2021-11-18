hs79_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs79",
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
get_hs79_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs79_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs79_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs79_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs79_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs79_nineq(; n::Integer = default_nvar, kwargs...) = 0
