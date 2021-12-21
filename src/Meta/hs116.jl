hs116_meta = Dict(
  :nvar => 13,
  :variable_nvar => false,
  :ncon => 15,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs116",
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
get_hs116_nvar(; n::Integer = default_nvar, kwargs...) = 13
get_hs116_ncon(; n::Integer = default_nvar, kwargs...) = 15
get_hs116_nlin(; n::Integer = default_nvar, kwargs...) = 5
get_hs116_nnln(; n::Integer = default_nvar, kwargs...) = 10
get_hs116_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs116_nineq(; n::Integer = default_nvar, kwargs...) = 15
