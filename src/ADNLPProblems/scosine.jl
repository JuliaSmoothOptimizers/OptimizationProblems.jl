export scosine

function scosine(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("scosine: number of variables must be ≥ 2")
  n = max(2, n)
  p = [exp(6 * (i - 1) // (n - 1)) for i = 1:n]
  function f(x)
    n = length(x)
    return sum(
      cos(eltype(x)(p[i])^2 * x[i]^2 - eltype(x)(p[i + 1]) * x[i + 1] / 2) for i = 1:(n - 1)
    )
  end
  x0 = T.([1 / p[i] for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "scosine"; kwargs...)
end
