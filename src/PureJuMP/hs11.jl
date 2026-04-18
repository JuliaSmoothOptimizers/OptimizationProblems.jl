export hs11

"HS11 model"
function hs11(args...; kwargs...)
  nlp = Model()
  x0 = [4.9, 0.1]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, (x[1] - 5)^2 + x[2]^2 - 25)

  @constraint(nlp, x[1]^2 ≤ x[2])

  return nlp
end
