export sbrybnd

function sbrybnd(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return sbrybnd(Val(model); kwargs...)
end

function sbrybnd(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n < 2 && @warn("sbrybnd: number of variables must be ≥ 2")
  n = max(2, n)
  p = [exp(6 * (i - 1) / (n - 1)) for i = 1:n]
  J = [[max(1, i - 5):(i - 1); (i + 1):min(n, i + 1)] for i = 1:n]

  function f(x; n = length(x))
    return 1 // 2 * sum(
      (
        (2 + 5 * eltype(x)(p[i])^2 * x[i]^2) * eltype(x)(p[i]) * x[i] + 1 -
        sum(eltype(x)(p[j]) * x[j] * (1 + eltype(x)(p[j]) * x[j]) for j in J[i])
      )^2 for i = 1:n
    )
  end
  x0 = T.([1 / p[i] for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "sbrybnd"; kwargs...)
end

function sbrybnd(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n < 2 && @warn("sbrybnd: number of variables must be ≥ 2")
  n = max(2, n)
  p = [exp(6 * (i - 1) / (n - 1)) for i = 1:n]
  J = [[max(1, i - 5):(i - 1); (i + 1):min(n, i + 1)] for i = 1:n]

  function F!(r, x; n = length(x))
    for i = 1:n
      r[i] =
        (2 + 5 * p[i]^2 * x[i]^2) * p[i] * x[i] + 1 -
        sum(p[j] * x[j] * (1 + p[j] * x[j]) for j in J[i])
    end
    return r
  end
  x0 = T.([1 / p[i] for i = 1:n])
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "sbrybnd-nls"; kwargs...)
end
