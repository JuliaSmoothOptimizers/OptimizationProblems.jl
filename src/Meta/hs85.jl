hs85_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 48,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs85",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -1.90513375,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs85_nvar(; n::Integer = 5, kwargs...) = 5
get_hs85_ncon(; n::Integer = 48, kwargs...) = 48
get_hs85_nlin(; n::Integer = 48, kwargs...) = 0
get_hs85_nnln(; n::Integer = 48, kwargs...) = 48
