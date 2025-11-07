torsion_meta = Dict(
  :nvar => 144,
  :variable_nvar => true,
  :ncon => 144,
  :variable_ncon => true,
  :minimize => true,
  :name => "torsion",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.3305785123966928,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_torsion_nvar(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = (nx + 2) * (ny + 2)
get_torsion_ncon(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = (nx + 2) * (ny + 2)
get_torsion_nlin(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = (nx + 2) * (ny + 2)
get_torsion_nnln(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = 0
get_torsion_nequ(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = 0
get_torsion_nineq(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = (nx + 2) * (ny + 2)
