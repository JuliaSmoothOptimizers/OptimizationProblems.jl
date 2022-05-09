export clnlbeam

function clnlbeam(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  N = div(n - 3, 3)
  h = one(T) / N
  alpha = 350
  function f(y)
    t, x, u = y[1:(N + 1)], y[(N + 2):(2 * N + 2)], y[(2 * N + 3):end]
    return sum(
      T(0.5) * h * (u[i + 1]^2 + u[i]^2) + T(0.5) * alpha * h * (cos(t[i + 1]) + cos(t[i])) for
      i = 1:N
    )
  end
  function c(y)
    t, x, u = y[1:(N + 1)], y[(N + 2):(2 * N + 2)], y[(2 * N + 3):end]
    return vcat(
      [t[i + 1] - t[i] - T(0.5) * h * u[i + 1] - T(0.5) * h * u[i] for i = 1:N],
      [x[i + 1] - x[i] - T(0.5) * h * (sin(t[i + 1]) + sin(t[i])) for i = 1:N],
    )
  end
  lvar = vcat(-ones(T, N + 1), -T(0.05) * ones(T, N + 1), -T(Inf) * ones(T, N + 1))
  uvar = vcat(ones(T, N + 1), T(0.05) * ones(T, N + 1), T(Inf) * ones(T, N + 1))
  xi = zeros(T, 3 * N + 3)
  return ADNLPModels.ADNLPModel(
    f,
    xi,
    lvar,
    uvar,
    c,
    zeros(T, 2 * N),
    zeros(T, 2 * N),
    lin = 1:N,
    name = "clnlbeam";
    kwargs...,
  )
end
