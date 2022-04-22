export polygon

function polygon(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  N = div(n, 2)
  function f(y)
    r, θ = y[1:N], y[(N + 1):end]
    return -T(0.5) * sum(r[i] * r[i + 1] * sin(θ[i + 1] - θ[i]) for i = 1:(N - 1))
  end
  function c(y::V) where V
    r, θ = y[1:N], y[(N + 1):end]
    ci = zeros(eltype(V), Int(N*(N - 1)/2))
    k = 1
    for i = 1:(N - 1),j=(i + 1):N
      ci[k] = r[i]^2 + r[j]^2 - 2 * r[i] * r[j] * cos(θ[i] - θ[j]) - 1
      k += 1
    end
    return vcat(θ[N], r[N], [θ[i + 1] - θ[i] for i = 1:(N - 1)], ci)
  end

  lvar = vcat(zeros(T, N), zeros(T, N))
  uvar = vcat(ones(T, N), T(π) * ones(T, N))
  x0 = vcat(
    ones(T, N),
    T[ i * π / (N - 1) - π / (N - 1) for i=1:N ]
  )
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    c,
    vcat(T(π), zeros(T, N), -T(Inf) * ones(T, Int(N*(N - 1)/2))),
    vcat(T(π), zero(T), T(Inf) * ones(T, N - 1), zeros(T, Int(N*(N - 1)/2))),
    name = "polygon",
    lin = collect(1:N + 1);
    kwargs...,
  )
end
