export rat43

function rat43(args...; kwargs...)
  y = Rational{Int}[
    16.08E0 1.0E0
    33.83E0 2.0E0
    65.80E0 3.0E0
    97.20E0 4.0E0
    191.55E0 5.0E0
    326.20E0 6.0E0
    386.87E0 7.0E0
    520.53E0 8.0E0
    590.03E0 9.0E0
    651.92E0 10.0E0
    724.93E0 11.0E0
    699.56E0 12.0E0
    689.96E0 13.0E0
    637.56E0 14.0E0
    717.41E0 15.0E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:4])
  set_start_value.(x, [100, 10, 1, 1]) # other: [700, 5, 0.75, 1.3]

  @objective(
    nlp,
    Min,
    0.5 * sum((y[i, 1] - x[1] / ((1 + exp(x[2] - x[3] * y[i, 2]))^(1 / x[4])))^2 for i = 1:15)
  )

  return nlp
end
