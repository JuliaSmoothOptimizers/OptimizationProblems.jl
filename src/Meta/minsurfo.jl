minsurfo_meta = Dict(
  :nvar => 400,
  :variable_nvar => false,
  :ncon => 480,
  :variable_ncon => false,
  :minimize => true,
  :name => "minsurfo",
  :has_equalities_only => false,
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
get_minsurfo_nvar(; n::Integer = default_nvar, kwargs...) = 400
get_minsurfo_ncon(; n::Integer = default_nvar, kwargs...) = 480
get_minsurfo_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_minsurfo_nnln(; n::Integer = default_nvar, kwargs...) = 480
get_minsurfo_nequ(; n::Integer = default_nvar, kwargs...) = 80
get_minsurfo_nineq(; n::Integer = default_nvar, kwargs...) = 400
