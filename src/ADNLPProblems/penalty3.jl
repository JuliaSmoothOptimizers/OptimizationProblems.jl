export penalty3

function penalty3(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 3 || error("penalty3 : n ≥ 3")
  function f(x)
    n = length(x)
    return 1 +
           sum((x[i] - 1)^2 for i = 1:div(n, 2)) +
           exp(x[n]) * sum((x[i] + 2 * x[i + 1] + 10 * x[i + 2] - 1)^2 for i = 1:(n - 2)) +
           sum((x[i] + 2 * x[i + 1] + 10 * x[i + 2] - 1)^2 for i = 1:(n - 2)) *
           sum((2 * x[i] + x[i + 1] - 3)^2 for i = 1:(n - 2)) +
           exp(x[n - 1]) * sum((2 * x[i] + x[i + 1] - 3)^2 for i = 1:(n - 2)) +
           (sum(x[i]^2 - n for i = 1:n))^2
  end
  x0 = T.([i / (n + 1) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "penalty3"; kwargs...)
end
