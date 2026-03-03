export dembo_gp2

function dembo_gp2(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  # Dembo GP2 objective: monomial in the decision variables
  # Example form (to match a typical GP2 benchmark):
  #   minimize   f(x) = x₁⁻¹ * x₂⁻¹ * x₃⁻²
  function f(x)
    return x[1]^(-1) * x[2]^(-1) * x[3]^(-2)
  end

  # Dembo GP2 nonlinear constraints, written in inequality form g(x) <= 0
  # Example set of posynomial inequalities:
  #   1) x₁ * x₂ * x₃² - 10 <= 0
  #   2) x₁ * x₃ - 2 <= 0
  #   3) x₂ * x₃ - 5 <= 0
  function c!(cx, x)
    cx[1] = x[1] * x[2] * x[3]^2 - 10
    cx[2] = x[1] * x[3] - 2
    cx[3] = x[2] * x[3] - 5
    return cx
  end

  # Initial point (feasible for the above constraints)
  x0 = T[1.0, 1.0, 1.0]

  # Nonlinear constraint bounds: each constraint is of the form g(x) <= 0
  lcon = T[typemin(T), typemin(T), typemin(T)]
  ucon = T[0.0, 0.0, 0.0]

  # No linear constraints for Dembo GP2: provide empty sparse data
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    Int[],             # row indices (no linear constraints)
    Int[],             # column indices (no linear constraints)
    T[],               # coefficients (no linear constraints)
    c!,
    lcon,
    ucon,
    name = "dembo_gp2";
    kwargs...,
  )
end
