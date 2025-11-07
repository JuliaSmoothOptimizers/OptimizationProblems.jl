minsurf_meta = Dict(
  :nvar => 144,
  :variable_nvar => true,
  :ncon => 256,
  :variable_ncon => true,
  :minimize => true,
  :name => "minsurf",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_minsurf_nvar(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = (nx + 2)*(ny + 2)
get_minsurf_ncon(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) =
  (nx + 2)*(ny + 2) +
  2*(nx + ny + 4) +
  (
    (2*divrem(nx + 1, 4)[1] + divrem(nx + 1, 4)[2] + 1) *
    (2*divrem(ny + 1, 4)[1] + divrem(ny + 1, 4)[2] + 1)
  )
get_minsurf_nlin(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) =
  (nx + 2)*(ny + 2) +
  2*(nx + ny + 4) +
  (
    (2*divrem(nx + 1, 4)[1] + divrem(nx + 1, 4)[2] + 1) *
    (2*divrem(ny + 1, 4)[1] + divrem(ny + 1, 4)[2] + 1)
  )
get_minsurf_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_minsurf_nequ(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = 2*(nx + ny + 4)
get_minsurf_nineq(;
  n::Integer = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) =
  (nx + 2) * (ny + 2) + (
    (2*divrem(nx + 1, 4)[1] + divrem(nx + 1, 4)[2] + 1) *
    (2*divrem(ny + 1, 4)[1] + divrem(ny + 1, 4)[2] + 1)
  )
