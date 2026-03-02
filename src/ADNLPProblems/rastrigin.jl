export rastrigin

function rastrigin(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return 10 * n + sum(x[i]^2 - 10 * cos(2 * T(π) * x[i]) for i = 1:n)
  end
  x0 = T[-5.12 + 10.24 * rand(T) for _ = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "rastrigin"; kwargs...)
end
