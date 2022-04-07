export NZF1

function NZF1(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  nbis = max(2, div(n, 13))
  n = 13 * nbis
  function f(x)
    nbis = max(2, div(n, 13))
    n = 13 * nbis
    l = div(n, 13)
    return sum(
      (3 * x[i] - 60 + T(0.1) * (x[i + 1] - x[i + 2])^2)^2 +
      (
        x[i + 1]^2 +
        x[i + 2]^2 +
        (x[i + 3]^2) * (1 + x[i + 3])^2 +
        x[i + 6] +
        x[i + 5] / (1 + x[i + 4]^2 + sin(x[i + 4] / 1000))
      )^2 +
      (x[i + 6] + x[i + 7] - x[i + 8]^2 + x[i + 10])^2 +
      (log(1 + x[i + 10]^2) + x[i + 11] - 5 * x[i + 12] + 20)^2 +
      (x[i + 4] + x[i + 5] + x[i + 5] * x[i + 9] + 10 * x[i + 9] - 50)^2 for i = 1:l
    ) + sum((x[i + 6] - x[i + 19])^2 for i = 1:(l - 1))
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "NZF1"; kwargs...)
end
