export hs317

"HS317 model"
function hs317(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2], start = 0)

  @constraint(nlp, x[1]^2 / 100 + x[2]^2 / 64 - 1 == 0)
  @objective(nlp, Min, (x[1] - 20)^2 + (x[2] + 20)^2)

  return nlp
end
