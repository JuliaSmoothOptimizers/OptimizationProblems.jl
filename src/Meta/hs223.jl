hs223_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs223",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -log(log(10)),
  :best_known_upper_bound => -0.1,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs223_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs223_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs223_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs223_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs223_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs223_nineq(; n::Integer = default_nvar, kwargs...) = 2
