export morebv

function morebv(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("morebv: number of variables must be ≥ 4")
  n = max(2, n)
  function f(x)
    h = T(1 / (n + 1))
    return sum(
             (2 * x[i] - x[i - 1] - x[i + 1] + (h^2 / 2) * (x[i] + i * h + 1)^3)^2 for i = 2:(n - 1)
           ) +
           (2 * x[1] - x[2] + (h^2 / 2) * (x[1] + 1)^3)^2 +
           (2 * x[n] - x[n - 1] + (h^2 / 2) * (x[n] + n * h + 1)^3)^2
  end

  x0 = ones(T, n) / 2

  return ADNLPModels.ADNLPModel(f, x0, name = "morebv_autodiff"; kwargs...)
end
