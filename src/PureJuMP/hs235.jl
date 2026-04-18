export hs235

"HS235 model"
function hs235(args...; kwargs...)
  nlp = Model()
  x0 = [-2, 3, 1]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @objective(nlp, Min, 0.01 * (x[1] - 1)^2 + (x[2] - x[1]^2)^2)
  @constraint(nlp, x[1] + x[3]^2 + 1 == 0)
  return nlp
end
