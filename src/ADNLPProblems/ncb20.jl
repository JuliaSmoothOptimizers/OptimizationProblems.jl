export ncb20

function ncb20(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 31 && @warn("ncb20: number of variables must be ≥ 31")
  n = max(31, n)
  function f(x; n = length(x))
    return 2 +
           sum(
             10 // i * (sum(x[i + j - 1] / (1 + x[i + j - 1]^2) for j = 1:20))^2 -
             2 // 10 * sum(x[i + j - 1] for j = 1:20) for i = 1:(n - 30)
           ) +
           sum(x[i]^4 + 2 for i = 1:(n - 10)) +
           1 // 10000 * sum(x[i] * x[i + 10] * x[i + n - 10] + 2 * x[i + n - 10]^2 for i = 1:10)
  end

  x0 = ones(T, n)
  x0[1:(n - 10)] .= zero(T)

  return ADNLPModels.ADNLPModel(f, x0, name = "ncb20"; kwargs...)
end
