export ncb20b

function ncb20b(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n = max(20, n)
  @adjust_nvar_warn("ncb20b", n_org, n)
  function f(x; n = length(x))
    return sum(
      10 // i * (sum(x[i + j - 1] / (1 + x[i + j - 1]^2) for j = 1:20))^2 -
      2 // 10 * sum(x[i + j - 1] for j = 1:20) for i = 1:(n - 19)
    ) + sum(100 * x[i]^4 + 2 for i = 1:n)
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "ncb20b"; kwargs...)
end
