britgas_meta = Dict(
  :nvar => 450,
  :variable_nvar => false,
  :ncon => 360,
  :variable_ncon => false,
  :minimize => true,
  :name => "britgas",
  :has_equalities_only => true,
  :has_inequalities_only => false,
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
get_britgas_nvar(; n::Integer = default_nvar, kwargs...) = 450
get_britgas_ncon(; n::Integer = default_nvar, kwargs...) = 360
get_britgas_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_britgas_nnln(; n::Integer = default_nvar, kwargs...) = 360
get_britgas_nequ(; n::Integer = default_nvar, kwargs...) = 360
get_britgas_nineq(; n::Integer = default_nvar, kwargs...) = 0
