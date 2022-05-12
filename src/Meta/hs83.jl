hs83_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs83",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs83_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_hs83_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs83_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs83_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs83_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs83_nineq(; n::Integer = default_nvar, kwargs...) = 3
