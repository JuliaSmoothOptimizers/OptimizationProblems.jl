export polygon1

function polygon1(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  N = div(n, 2)
  function f(y)
    r, θ = y[1:N], y[(N + 1):end]
    return -T(0.5) * sum(r[i] * r[i + 1] * sin(θ[i + 1] - θ[i]) for i = 1:(N - 1)) -
           T(0.5) * r[1] * r[N] * sin(θ[1] - θ[N])
  end
  function c(y)
    r, θ = y[1:N], y[(N + 1):end]
    return vcat([θ[i + 1] - θ[i] for i = 1:(N - 1)], θ[1])
  end
  lvar = vcat(zeros(T, N), zeros(T, N))
  uvar = vcat(ones(T, N), T(2π) * ones(T, N))
  xi = zeros(T, 2 * N)
  return ADNLPModels.ADNLPModel(
    f,
    xi,
    lvar,
    uvar,
    c,
    vcat(T(Inf) * ones(T, N - 1), zero(T)),
    zeros(T, N),
    name = "polygon1_autodiff",
    lin = collect(1:N);
    kwargs...,
  )
end 
