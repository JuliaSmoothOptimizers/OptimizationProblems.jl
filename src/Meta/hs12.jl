hs12_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs12",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs12_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs12_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs12_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs12_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs12_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs12_nineq(; n::Integer = default_nvar, kwargs...) = 1
