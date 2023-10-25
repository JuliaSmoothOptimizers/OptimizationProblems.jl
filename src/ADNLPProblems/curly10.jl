export curly10

function curly10(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n < 2 && @warn("curly: number of variables must be ≥ 2")
  n = max(2, n)
  b = 10
  function f(x; n = n, b = b)
    return sum(
      (sum(x[j] for j = i:min(i + b, n))) * (
        (sum(x[j] for j = i:min(i + b, n))) * ((sum(x[j] for j = i:min(i + b, n)))^2 - 20) -
        1 // 10
      ) for i = 1:n
    )
  end
  x0 = T[1.0e-4 * i / (n + 1) for i = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "curly10"; kwargs...)
end
