export hs7

"HS7 model"
function hs7(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2], start = 2)

  @objective(nlp, Min, log(1 + x[1]^2) - x[2])

  @constraint(nlp, (1 + x[1]^2)^2 + x[2]^2 - 4 == 0)

  return nlp
end
