export genrose_nash

function genrose_nash(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n < 2 && @warn("genrose_nash: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x; n = length(x))
    return 1 + 100 * sum((x[i] - x[i - 1]^2)^2 for i = 2:n) + sum((1 - x[i])^2 for i = 2:n)
  end
  x0 = T.([(i / (n + 1)) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "genrose_nash"; kwargs...)
end
