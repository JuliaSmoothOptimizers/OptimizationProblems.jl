hs117_meta = Dict(
  :nvar => 15,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs117",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2400.1053000599995,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs117_nvar(; n::Integer = default_nvar, kwargs...) = 15
get_hs117_ncon(; n::Integer = default_nvar, kwargs...) = 5
get_hs117_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs117_nnln(; n::Integer = default_nvar, kwargs...) = 5
get_hs117_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs117_nineq(; n::Integer = default_nvar, kwargs...) = 5
