structural_meta = Dict(
  :nvar =>
    2 * Int(
      min(Int(round(default_nvar^(1 / 3))), 6) *
      Int(round(default_nvar^(1 / 3))) *
      (min(Int(round(default_nvar^(1 / 3))), 6) * Int(round(default_nvar^(1 / 3))) - 1) / 2,
    ),
  :variable_nvar => true,
  :ncon =>
    2 * (
      min(Int(round(default_nvar^(1 / 3))), 6) * Int(round(default_nvar^(1 / 3))) -
      (min(Int(round(default_nvar^(1 / 3))), 6) - 2)
    ),
  :variable_ncon => true,
  :minimize => true,
  :name => "structural",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_structural_nvar(; n::Integer = default_nvar, kwargs...) =
  2 * Int(
    min(Int(round(max(100, n)^(1 / 3))), 6) *
    Int(round(max(100, n)^(1 / 3))) *
    (min(Int(round(max(100, n)^(1 / 3))), 6) * Int(round(max(100, n)^(1 / 3))) - 1) / 2,
  )
get_structural_ncon(; n::Integer = default_nvar, kwargs...) =
  2 * (
    min(Int(round(max(100, n)^(1 / 3))), 6) * Int(round(max(100, n)^(1 / 3))) -
    (min(Int(round(max(100, n)^(1 / 3))), 6) - 2)
  ) +
  2 * Int(
    min(Int(round(max(100, n)^(1 / 3))), 6) *
    Int(round(max(100, n)^(1 / 3))) *
    (min(Int(round(max(100, n)^(1 / 3))), 6) * Int(round(max(100, n)^(1 / 3))) - 1) / 2,
  )
get_structural_nlin(; n::Integer = default_nvar, kwargs...) =
  2 * (
    min(Int(round(max(100, n)^(1 / 3))), 6) * Int(round(max(100, n)^(1 / 3))) -
    (min(Int(round(max(100, n)^(1 / 3))), 6) - 2)
  ) +
  2 * Int(
    min(Int(round(max(100, n)^(1 / 3))), 6) *
    Int(round(max(100, n)^(1 / 3))) *
    (min(Int(round(max(100, n)^(1 / 3))), 6) * Int(round(max(100, n)^(1 / 3))) - 1) / 2,
  )
get_structural_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_structural_nequ(; n::Integer = default_nvar, kwargs...) =
  2 * (
    min(Int(round(max(100, n)^(1 / 3))), 6) * Int(round(max(100, n)^(1 / 3))) -
    (min(Int(round(max(100, n)^(1 / 3))), 6) - 2)
  )
get_structural_nineq(; n::Integer = default_nvar, kwargs...) =
  2 * Int(
    min(Int(round(max(100, n)^(1 / 3))), 6) *
    Int(round(max(100, n)^(1 / 3))) *
    (min(Int(round(max(100, n)^(1 / 3))), 6) * Int(round(max(100, n)^(1 / 3))) - 1) / 2,
  )
