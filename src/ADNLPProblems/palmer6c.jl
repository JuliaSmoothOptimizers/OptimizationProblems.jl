export palmer6c

function palmer6c(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  X = T[
    0.000000,
    1.570796,
    1.396263,
    1.221730,
    1.047198,
    0.872665,
    0.785398,
    0.732789,
    0.698132,
    0.610865,
    0.523599,
    0.349066,
    0.174533,
  ]

  Y = T[
    10.678659,
    75.414511,
    41.513459,
    20.104735,
    7.432436,
    1.298082,
    0.171300,
    0.000000,
    0.068203,
    0.774499,
    2.070002,
    5.574556,
    9.026378,
  ]
  function f(x)
    n = length(x)
    return sum((Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:8))^2 for i = 1:13)
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer6c"; kwargs...)
end
