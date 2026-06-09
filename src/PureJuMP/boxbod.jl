export boxbod

function boxbod(args...; kwargs...)
  y = Rational{Int}[
    109 1
    149 2
    149 3
    191 5
    213 7
    224 10
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:2])
  set_start_value.(x, [1, 1]) # other: [100, 0.75]

  @objective(nlp, Min, 0.5 * sum((y[i, 1] - x[1] * (1 - exp(-x[2] * y[i, 2])))^2 for i = 1:6))

  return nlp
end
