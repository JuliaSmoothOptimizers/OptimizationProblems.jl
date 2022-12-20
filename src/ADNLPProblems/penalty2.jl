export penalty2

function penalty2(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 3 && @warn("penalty2: number of variables must be ≥ 3")
  n = max(3, n)
  function f(x; n = length(x))
    a = 1 // 100000
    m = 2 * n
    y = eltype(x)[exp(i // 10) + exp((i - 1) // 10) for i = 1:m]
    return (x[1] - 2 // 10)^2 +
           sum(a * (exp(x[i] / 10) + exp(x[i - 1] / 10) - y[i])^2 for i = 2:n) +
           sum(
             a * (exp(x[i - n + 1] / 10) - eltype(x)(exp(-1 // 10)))^2 for i = (n + 1):(2 * n - 1)
           ) +
           (sum((n - j + 1) * x[j]^2 for j = 1:n) - 1)^2
  end
  x0 = ones(T, n) / 2
  return ADNLPModels.ADNLPModel(f, x0, name = "penalty2"; kwargs...)
end
