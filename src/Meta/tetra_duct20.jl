tetra_duct20_meta = Dict(
  :nvar => 3201,
  :variable_nvar => false,
  :ncon => 4104,
  :variable_ncon => false,
  :minimize => true,
  :name => "tetra_duct20",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 4959.804733960625,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_tetra_duct20_nvar(; n::Integer = default_nvar, kwargs...) = 3201
get_tetra_duct20_ncon(; n::Integer = default_nvar, kwargs...) = 4104
get_tetra_duct20_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_duct20_nnln(; n::Integer = default_nvar, kwargs...) = 4104
get_tetra_duct20_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_duct20_nineq(; n::Integer = default_nvar, kwargs...) = 4104
