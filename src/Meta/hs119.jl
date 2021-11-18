hs119_meta = Dict(
  :nvar => 16,
  :variable_nvar => false,
  :ncon => 8,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs119",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs119_nvar(; n::Integer = default_nvar, kwargs...) = 16
get_hs119_ncon(; n::Integer = default_nvar, kwargs...) = 8
get_hs119_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs119_nnln(; n::Integer = default_nvar, kwargs...) = 8
get_hs119_nequ(; n::Integer = default_nvar, kwargs...) = 8
get_hs119_nineq(; n::Integer = default_nvar, kwargs...) = 0
