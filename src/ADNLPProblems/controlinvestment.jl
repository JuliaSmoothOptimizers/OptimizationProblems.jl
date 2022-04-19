export controlinvestment

function controlinvestment(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  N = div(n, 2)
  h = T(1 / N)
  x0 = 1
  gamma = 3
  function f(y)
    x, u = y[1:N], y[(N + 1):end]
    return T(0.5) * h * sum((u[k] - 1) * x[k] + (u[k + 1] - 1) * x[k + 1] for k = 1:(N - 1))
  end
  function c(y)
    x, u = y[1:N], y[(N + 1):end]
    return vcat([
        x[k + 1] - x[k] - T(0.5) * h * gamma * (u[k] * x[k] + u[k + 1] * x[k + 1]) for k = 1:(N - 1)
      ],
      x[1] - one(T),
    )
  end
  lvar = vcat(-T(Inf) * ones(T, N), zeros(T, N))
  uvar = vcat(T(Inf) * ones(T, N), ones(T, N))
  xi = vcat(ones(T, N), zeros(T, N))
  return ADNLPModels.ADNLPModel(
    f,
    xi,
    lvar,
    uvar,
    c,
    zeros(T, N),
    zeros(T, N),
    name = "controlinvestment",
    lin = [N],
    ;
    kwargs...,
  )
end 
