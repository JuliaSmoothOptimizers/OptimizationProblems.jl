export hs111

function hs111(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  ci = [
    -6089 // 1000,
    -17164 // 1000,
    -34054 // 1000,
    -5914 // 1000,
    -24721 // 1000,
    -14986 // 1000,
    -24100 // 1000,
    -10708 // 1000,
    -26662 // 1000,
    -22179 // 1000,
  ]
  function f(x; ci = ci)
    return sum(exp(x[j]) * (ci[j] + x[j] - log(sum([exp(x[k]) for k = 1:10]))) for j = 1:10)
  end
  x0 = -T(2.3) * ones(T, 10)
  lvar = -100 * ones(T, 10)
  uvar = 100 * ones(T, 10)
  function c!(cx, x)
    cx[1] = exp(x[1]) + 2 * exp(x[2]) + 2 * exp(x[3]) + exp(x[6]) + exp(x[10]) - 2
    cx[2] = exp(x[4]) + 2 * exp(x[5]) + exp(x[6]) + exp(x[7]) - 1
    cx[3] = exp(x[3]) + exp(x[7]) + exp(x[8]) + 2 * exp(x[9]) + exp(x[10]) - 1
    return cx
  end
  lcon = zeros(T, 3)
  ucon = zeros(T, 3)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs111"; kwargs...)
end
