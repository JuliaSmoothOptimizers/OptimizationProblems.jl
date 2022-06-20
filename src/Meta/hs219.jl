hs219_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs219",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :linear,
  :contype => :general,
  :best_known_lower_bound => -1.,
  :best_known_upper_bound => -1.,
  :is_feasible => true,
  :defined_everywhere => true,
  :origin => :unknown,
)
get_hs219_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs219_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs219_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs219_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs219_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs219_nineq(; n::Integer = default_nvar, kwargs...) = 0
