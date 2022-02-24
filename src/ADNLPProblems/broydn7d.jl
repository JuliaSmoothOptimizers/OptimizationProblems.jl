export broydn7d

function broydn7d(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  mod(n, 2) > 0 && @warn("broydn7d: number of variables adjusted to be even")
  n2 = max(1, div(n, 2))
  n = 2 * n2
  function f(x)
    n = length(x)
    p = T(7 / 3)
    return abs(1 - 2 * x[2] + (3 - x[1] / 2) * x[1])^p +
           sum(abs(1 - x[i - 1] - 2 * x[i + 1] + (3 - x[i] / 2) * x[i])^p for i = 2:(n - 1)) +
           abs(1 - x[n - 1] + (3 - x[n] / 2) * x[n])^p +
           sum(abs(x[i] + x[i + n2])^p for i = 1:n2)
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "broydn7d"; kwargs...)
end
