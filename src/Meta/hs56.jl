hs56_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs56",
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
get_hs56_nvar(; n::Integer = default_nvar, kwargs...) = 7
get_hs56_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs56_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs56_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_hs56_nequ(; n::Integer = default_nvar, kwargs...) = 4
get_hs56_nineq(; n::Integer = default_nvar, kwargs...) = 0
