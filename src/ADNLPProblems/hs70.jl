export hs70

function hs70(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  ci = Array{T}(undef, 19)
  ci[1] = 0.1
  for i = 2:19
    ci[i] = i - 1
  end

  yobs = Array{T}(undef, 19)
  yobs[1:10] = [0.00189, 0.1038, 0.268, 0.506, 0.577, 0.604, 0.725, 0.898, 0.947, 0.845]
  yobs[11:19] = [0.702, 0.528, 0.385, 0.257, 0.159, 0.0869, 0.0453, 0.01509, 0.00189]
  function f(x)
    n = length(x)
    b = x[3] + (1 - x[3]) * x[4]
    ycal = [
      (1 + 1 / (12 * x[2])) * (
        x[3] *
        b^x[2] *
        (x[2] / T(6.2832))^(T(0.5)) *
        (ci[i] / T(7.685))^(x[2] - 1) *
        exp(x[2] - b * ci[i] * x[2] / T(7.658))
      ) +
      (1 + 1 / (12 * x[1])) *
      (1 - x[3]) *
      (b / x[4])^x[1] *
      (x[1] / T(6.2832))^T(0.5) *
      (ci[i] / T(7.658))^(x[1] - 1) *
      exp(x[1] - b * ci[i] * x[1] / (T(7.658) * x[4])) for i = 1:19
    ]
    return sum((ycal[i] - yobs[i])^2 for i = 1:19)
  end
  x0 = T[2, 4, 0.04, 2]
  lvar = T(0.00001) * ones(T, 4)
  uvar = T[100, 100, 1, 100]
  function c(x)
    n = length(x)
    return [x[3] + (1 - x[3]) * x[4]]
  end
  lcon = zeros(T, 1)
  ucon = T(Inf) * ones(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs70"; kwargs...)
end
