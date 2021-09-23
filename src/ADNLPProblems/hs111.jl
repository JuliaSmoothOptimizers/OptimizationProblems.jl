export hs111 
 
function hs111(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  ci = T[-6.089, -17.164, -34.054, -5.914, -24.721, -14.986, -24.100, -10.708, -26.662, -22.179]
  function f(x)
    n = length(x)
    return sum([exp(x[j]) * (ci[j] + x[j] - log(sum([exp(x[k]) for k = 1:10]))) for j = 1:10])
  end
  x0 = -T(2.3) * ones(T, 10)
  lvar = -100 * ones(T, 10)
  uvar = 100 * ones(T, 10)
  function c(x)
    n = length(x)
    return [
      exp(x[1]) + 2 * exp(x[2]) + 2 * exp(x[3]) + exp(x[6]) + exp(x[10]) - 2,
      exp(x[4]) + 2 * exp(x[5]) + exp(x[6]) + exp(x[7]) - 1,
      exp(x[3]) + exp(x[7]) + exp(x[8]) + 2 * exp(x[9]) + exp(x[10]) - 1
    ]
  end
  lcon = zeros(T, 3)
  ucon = zeros(T, 3)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs111"; kwargs...)
end
