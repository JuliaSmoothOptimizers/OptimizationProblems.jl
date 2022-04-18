export polygon2

function polygon2(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  N = div(n, 2)
  function f(y)
    r, α = y[1:N], y[(N + 1):end]
    return -T(0.5) * sum(r[i] * r[i + 1] * sin(α[i]) for i = 1:(N - 1)) -
           T(0.5) * r[1] * r[N] * sin(α[N])
  end
  function c(y)
    r, α = y[1:N], y[(N + 1):end]
    return [sum(α) - 2π]
  end
  lvar = vcat(zeros(T, N), zeros(T, N))
  uvar = vcat(ones(T, N), T(Inf) * ones(T, N))
  xi = zeros(T, 2 * N)
  return ADNLPModels.ADNLPModel(
    f,
    xi,
    lvar,
    uvar,
    c,
    zeros(T, 1),
    zeros(T, 1),
    name = "polygon2",
    lin = collect(1:1);
    kwargs...,
  )
end
