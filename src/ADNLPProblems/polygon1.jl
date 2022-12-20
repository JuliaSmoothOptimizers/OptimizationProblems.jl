export polygon1

function polygon1(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  N = div(n, 2)
  function f(y; N = N)
    r, θ = y[1:N], y[(N + 1):end]
    return -1 // 2 * sum(r[i] * r[i + 1] * sin(θ[i + 1] - θ[i]) for i = 1:(N - 1)) -
           1 // 2 * r[1] * r[N] * sin(θ[1] - θ[N])
  end
  clinrows = vcat([1], [1 + i for i = 1:(N - 1)], [1 + i for i = 1:(N - 1)])
  clincols = vcat([N + 1], [N + i + 1 for i = 1:(N - 1)], [N + i for i = 1:(N - 1)])
  clinvals = vcat(T[1], T[1 for i = 1:(N - 1)], T[-1 for i = 1:(N - 1)])

  lvar = vcat(zeros(T, N), zeros(T, N))
  uvar = vcat(ones(T, N), T(2π) * ones(T, N))
  xi = zeros(T, 2 * N)
  return ADNLPModels.ADNLPModel(
    f,
    xi,
    lvar,
    uvar,
    clinrows,
    clincols,
    clinvals,
    zeros(T, N),
    vcat(zero(T), T(Inf) * ones(T, N - 1)),
    name = "polygon1";
    kwargs...,
  )
end
