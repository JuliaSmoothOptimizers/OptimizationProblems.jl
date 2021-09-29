export palmer5c

function palmer5c(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  X = T[
    0.000000,
    1.570796,
    1.396263,
    1.308997,
    1.221730,
    1.125835,
    1.047198,
    0.872665,
    0.698132,
    0.523599,
    0.349066,
    0.174533,
  ]

  Y = T[
    83.57418,
    81.007654,
    18.983286,
    8.051067,
    2.044762,
    0.000000,
    1.170451,
    10.479881,
    25.785001,
    44.126844,
    62.822177,
    77.719674,
  ]

  b = X[2]
  a = -b
  d = 2 * b

  t = zeros(T, 12, 15)
  for k = 1:12
    t[k, 1] = 1
    t[k, 2] = (2 * X[k] - a - b) / d
    for l = 3:15
      t[k, l] = 2 * t[k, l - 1] * (2 * X[k] - a - b) / d - t[k, l - 2]
    end
  end
  function f(x)
    n = length(x)
    return sum((Y[i] - sum(x[j] * t[i, 2 * j - 1] for j = 1:6))^2 for i = 1:12)
  end
  x0 = ones(T, 6)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer5c"; kwargs...)
end
