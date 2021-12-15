export fletchcr

function fletchcr(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 100 * sum((x[i + 1] - x[i] + 1 - x[i]^2)^2 for i = 1:(n - 1))
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "fletchcr"; kwargs...)
end
