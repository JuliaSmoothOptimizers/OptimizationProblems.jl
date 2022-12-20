export clnlbeam

function clnlbeam(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  N = div(n - 3, 3)
  h = 1 // N
  alpha = 350
  function f(y; N = N, h = h, alpha = alpha)
    @views t, x, u = y[1:(N + 1)], y[(N + 2):(2 * N + 2)], y[(2 * N + 3):end]
    return sum(
      1 // 2 * h * (u[i + 1]^2 + u[i]^2) + 1 // 2 * alpha * h * (cos(t[i + 1]) + cos(t[i])) for
      i = 1:N
    )
  end
  function c(y)
    t, x, u = y[1:(N + 1)], y[(N + 2):(2 * N + 2)], y[(2 * N + 3):end]
    return vcat([x[i + 1] - x[i] - 1 // 2 * h * (sin(t[i + 1]) + sin(t[i])) for i = 1:N],)
  end
  lvar = vcat(-ones(T, N + 1), -T(0.05) * ones(T, N + 1), -T(Inf) * ones(T, N + 1))
  uvar = vcat(ones(T, N + 1), T(0.05) * ones(T, N + 1), T(Inf) * ones(T, N + 1))
  xi = zeros(T, 3 * N + 3)

  # [t[i + 1] - t[i] - T(0.5) * h * u[i + 1] - T(0.5) * h * u[i] for i = 1:N]
  clinrows = vcat(
    1:N, # t[i + 1]
    1:N,
    1:N,
    1:N,
  )
  clincols = vcat(
    [i + 1 for i = 1:N], # t[i + 1]
    [i for i = 1:N], # t[i]
    [2 * N + 2 + i + 1 for i = 1:N], # u[i + 1]
    [2 * N + 2 + i for i = 1:N], # u[i]
  )
  clinvals = vcat(
    T[1 for i = 1:N], # t[i + 1]
    T[-1 for i = 1:N], # t[i]
    [-T(0.5) * h for i = 1:N], # u[i + 1]
    [-T(0.5) * h for i = 1:N], # u[i]
  )
  return ADNLPModels.ADNLPModel(
    f,
    xi,
    lvar,
    uvar,
    clinrows,
    clincols,
    clinvals,
    c,
    zeros(T, 2 * N),
    zeros(T, 2 * N),
    name = "clnlbeam";
    kwargs...,
  )
end
