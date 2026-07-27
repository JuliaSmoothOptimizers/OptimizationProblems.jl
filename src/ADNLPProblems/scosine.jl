export scosine

function scosine(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n = max(2, n)
  @adjust_nvar_warn("scosine", n_org, n)
  p = [exp(6 * (i - 1) // (n - 1)) for i = 1:n]
  function f(x; n = length(x))
    return sum(
      cos(eltype(x)(p[i])^2 * x[i]^2 - eltype(x)(p[i + 1]) * x[i + 1] / 2) for i = 1:(n - 1)
    )
  end
  x0 = T.([1 / p[i] for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "scosine"; kwargs...)
end
