export danwood

function danwood(args...; kwargs...)
  y = Rational{Int}[
    2.138E0 1.309E0
    3.421E0 1.471E0
    3.597E0 1.490E0
    4.340E0 1.565E0
    4.882E0 1.611E0
    5.660E0 1.680E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:2])
  set_start_value.(x, [1, 5]) # other: [0.7, 4]

  @objective(nlp, Min, 0.5 * sum((y[i, 1] - x[1] * y[i, 1]^(x[2]))^2 for i = 1:6))

  return nlp
end
