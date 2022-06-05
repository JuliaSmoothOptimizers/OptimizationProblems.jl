tetra_duct15_meta = Dict(
  :nvar => 6417,
  :variable_nvar => false,
  :ncon => 9000,
  :variable_ncon => false,
  :minimize => true,
  :name => "tetra_duct15",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 10890.937025065883,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_tetra_duct15_nvar(; n::Integer = default_nvar, kwargs...) = 6417
get_tetra_duct15_ncon(; n::Integer = default_nvar, kwargs...) = 9000
get_tetra_duct15_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_duct15_nnln(; n::Integer = default_nvar, kwargs...) = 9000
get_tetra_duct15_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_duct15_nineq(; n::Integer = default_nvar, kwargs...) = 9000
