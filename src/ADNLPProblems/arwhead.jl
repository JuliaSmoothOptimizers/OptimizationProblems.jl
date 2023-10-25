export arwhead

function arwhead(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n < 2 && @warn("arwhead: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x; n = length(x))
    return sum((x[i]^2 + x[n]^2)^2 - 4 * x[i] + 3 for i = 1:(n - 1))
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "arwhead"; kwargs...)
end
