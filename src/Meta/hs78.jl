hs78_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs78",
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
get_hs78_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs78_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs78_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs78_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs78_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs78_nineq(; n::Integer = default_nvar, kwargs...) = 0
