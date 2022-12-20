export polygon2

function polygon2(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  N = div(n, 2)
  function f(y; N = N)
    r, α = y[1:N], y[(N + 1):end]
    return -1 // 2 * sum(r[i] * r[i + 1] * sin(α[i]) for i = 1:(N - 1)) -
           1 // 2 * r[1] * r[N] * sin(α[N])
  end
  function c(y)
    r, α = y[1:N], y[(N + 1):end]
    return [sum(α)]
  end
  lvar = vcat(zeros(T, N), zeros(T, N))
  uvar = vcat(ones(T, N), T(Inf) * ones(T, N))
  xi = zeros(T, 2 * N)
  return ADNLPModels.ADNLPModel(
    f,
    xi,
    lvar,
    uvar,
    ones(Int, N),
    collect((N + 1):(2 * N)),
    ones(T, N),
    T[2π],
    T[2π],
    name = "polygon2";
    kwargs...,
  )
end
