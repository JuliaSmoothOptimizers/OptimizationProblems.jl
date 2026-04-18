export hs316

"HS316 model"
function hs316(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2], start = 0)

  @constraint(nlp, x[1]^2 / 100 + x[2]^2 / 100 - 1 == 0)
  @objective(nlp, Min, (x[1] - 20)^2 + (x[2] + 20)^2)

  return nlp
end
