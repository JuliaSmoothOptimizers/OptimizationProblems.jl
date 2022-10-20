export controlinvestment

function controlinvestment(
  args...;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  N = div(n, 2)
  h = 1 // N
  x0 = 1
  gamma = 3
  function f(y)
    x, u = y[1:N], y[(N + 1):end]
    return 1 // 2 * h * sum((u[k] - 1) * x[k] + (u[k + 1] - 1) * x[k + 1] for k = 1:(N - 1))
  end
  function c(y)
    x, u = y[1:N], y[(N + 1):end]
    return vcat([
      x[k + 1] - x[k] - 1 // 2 * h * gamma * (u[k] * x[k] + u[k + 1] * x[k + 1]) for k = 1:(N - 1)
    ],)
  end
  lvar = vcat(-T(Inf) * ones(T, N), zeros(T, N))
  uvar = vcat(T(Inf) * ones(T, N), ones(T, N))
  xi = vcat(ones(T, N), zeros(T, N))
  return ADNLPModels.ADNLPModel(
    f,
    xi,
    lvar,
    uvar,
    [1],
    [1],
    T[1],
    c,
    vcat(one(T), zeros(T, N - 1)),
    vcat(one(T), zeros(T, N - 1)),
    name = "controlinvestment";
    kwargs...,
  )
end
