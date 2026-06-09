export misra1b

function misra1b(args...; kwargs...)
  y = Rational{Int}[
    10.07E0 77.6E0
    14.73E0 114.9E0
    17.94E0 141.1E0
    23.93E0 190.8E0
    29.61E0 239.9E0
    35.18E0 289.0E0
    40.02E0 332.8E0
    44.82E0 378.4E0
    50.76E0 434.8E0
    55.05E0 477.3E0
    61.01E0 536.8E0
    66.40E0 593.1E0
    75.47E0 689.1E0
    81.78E0 760.0E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:2])
  set_start_value.(x, [500, 0.0001]) # other: [0.0001, 0.0002]

  @objective(
    nlp,
    Min,
    0.5 * sum((y[i, 1] - x[1] * (1 - (1 + x[2] * y[i, 2] / 2)^(-2)))^2 for i = 1:14)
  )

  return nlp
end
