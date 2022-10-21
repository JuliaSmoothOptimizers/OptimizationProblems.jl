export curly20

function curly20(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("curly: number of variables must be ≥ 2")
  n = max(2, n)
  b = 20
  function f(x)
    n = length(x)
    return sum(
      (sum(x[j] for j = i:min(i + b, n))) * (
        (sum(x[j] for j = i:min(i + b, n))) * ((sum(x[j] for j = i:min(i + b, n)))^2 - 20) -
        1 // 10
      ) for i = 1:n
    )
  end
  x0 = T[1.0e-4 * i / (n + 1) for i = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "curly20"; kwargs...)
end
