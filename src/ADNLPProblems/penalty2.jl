export penalty2

function penalty2(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 3 || error("penalty2 : n ≥ 3")
  function f(x)
    n = length(x)
    a = T(1.0e-5)
    m = 2 * n
    y = ones(T, m)
    for i = 1:m
      y[i] = exp(i / 10) + exp((i - 1) / 10)
    end
    return (x[1] - T(0.2))^2 +
           sum(a * (exp(x[i] / 10) + exp(x[i - 1] / 10) - y[i])^2 for i = 2:n) +
           sum(a * (exp(x[i - n + 1] / 10) - T(exp(-1 / 10)))^2 for i = (n + 1):(2 * n - 1)) +
           (sum((n - j + 1) * x[j]^2 for j = 1:n) - 1)^2
  end
  x0 = ones(T, n) / 2
  return ADNLPModels.ADNLPModel(f, x0, name = "penalty2"; kwargs...)
end
