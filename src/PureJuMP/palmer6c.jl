export palmer6c

"A linear least squares problem arising from chemical kinetics."
function palmer6c(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x[j = 1:8], start = 1.0)

  X = [
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

  Y = [
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

  @objective(nlp, Min, 0.5 * sum((Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:8))^2 for i = 1:13))

  return nlp
end
