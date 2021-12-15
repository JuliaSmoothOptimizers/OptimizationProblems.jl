export cosine

function cosine(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sum(cos(x[i]^2 - x[i + 1] / 2) for i = 1:(n - 1))
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "cosine"; kwargs...)
end
