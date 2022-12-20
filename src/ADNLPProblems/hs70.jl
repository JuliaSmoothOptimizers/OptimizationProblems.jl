export hs70

function hs70(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  ci = Array{Rational{Int}}(undef, 19)
  ci[1] = 1 // 10
  for i = 2:19
    ci[i] = i - 1
  end

  yobs = Array{Rational{Int}}(undef, 19)
  yobs[1:10] = [
    189 // 100000,
    1038 // 10000,
    268 // 1000,
    506 // 1000,
    577 // 1000,
    604 // 1000,
    725 // 1000,
    898 // 1000,
    947 // 1000,
    845 // 1000,
  ]
  yobs[11:19] = [
    702 // 1000,
    528 // 1000,
    385 // 1000,
    257 // 1000,
    159 // 1000,
    869 // 10000,
    453 // 10000,
    1509 // 100000,
    189 // 100000,
  ]
  function f(x; yobs = yobs, ci = ci)
    b = x[3] + (1 - x[3]) * x[4]
    ycal = [
      (1 + 1 / (12 * x[2])) * (
        x[3] *
        b^x[2] *
        (x[2] / (62832 // 10000))^(1 // 2) *
        (ci[i] / (7685 // 1000))^(x[2] - 1) *
        exp(x[2] - b * ci[i] * x[2] / (7658 // 1000))
      ) +
      (1 + 1 / (12 * x[1])) *
      (1 - x[3]) *
      (b / x[4])^x[1] *
      (x[1] / (62832 // 10000))^(1 // 2) *
      (ci[i] / (7658 // 1000))^(x[1] - 1) *
      exp(x[1] - b * ci[i] * x[1] / ((7658 // 1000) * x[4])) for i = 1:19
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
