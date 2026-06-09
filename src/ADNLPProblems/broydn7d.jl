export broydn7d

function broydn7d(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n2 = max(1, div(n, 2))
  n = 2 * n2
  @adjust_nvar_warn("broydn7d", n_org, n)
  function f(x; n = length(x), n2 = n2)
    p = 7 // 3
    return abs(1 - 2 * x[2] + (3 - x[1] / 2) * x[1])^p +
           sum(abs(1 - x[i - 1] - 2 * x[i + 1] + (3 - x[i] / 2) * x[i])^p for i = 2:(n - 1)) +
           abs(1 - x[n - 1] + (3 - x[n] / 2) * x[n])^p +
           sum(abs(x[i] + x[i + n2])^p for i = 1:n2)
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "broydn7d"; kwargs...)
end
