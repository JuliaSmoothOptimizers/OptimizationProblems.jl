export rat42

function rat42(args...; kwargs...)
  y = Rational{Int}[
    8.930E0 9.000E0
    10.800E0 14.000E0
    18.590E0 21.000E0
    22.330E0 28.000E0
    39.350E0 42.000E0
    56.110E0 57.000E0
    61.730E0 63.000E0
    64.620E0 70.000E0
    67.080E0 79.000E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:3])
  set_start_value.(x, [100, 1, 0.1]) # other: [75, 2.5, 0.07]

  @objective(nlp, Min, 0.5 * sum((y[i, 1] - x[1] / (1 + exp(x[2] - x[3] * y[i, 2])))^2 for i = 1:9))

  return nlp
end
