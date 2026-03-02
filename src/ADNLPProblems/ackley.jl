export ackley

function ackley(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    sum1 = sum(x[i]^2 for i = 1:n)
    sum2 = sum(cos(2 * T(π) * x[i]) for i = 1:n)
    return -20 * exp(-T(0.2) * sqrt(sum1 / n)) - exp(sum2 / n) + 20 + T(ℯ)
  end
  x0 = T[-32 + 64 * rand(T) for _ = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "ackley"; kwargs...)
end
