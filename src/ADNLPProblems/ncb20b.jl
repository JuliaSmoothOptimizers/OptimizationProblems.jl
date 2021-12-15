export ncb20b

function ncb20b(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 20 || error("ncb20 : n ≥ 20")
  function f(x)
    n = length(x)
    h = T(1 / (n - 1))
    return sum(
      T(10 / i) * (sum(x[i + j - 1] / (1 + x[i + j - 1]^2) for j = 1:20))^2 -
      T(0.2) * sum(x[i + j - 1] for j = 1:20) for i = 1:(n - 19)
    ) + sum(100 * x[i]^4 + 2 for i = 1:n)
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "ncb20b"; kwargs...)
end
