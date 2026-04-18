export hs39

"HS39 model"
function hs39(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:4], start = 2)

  @objective(nlp, Min, -x[1])

  @constraint(nlp, x[2] - x[1]^3 - x[3]^2 == 0)

  @constraint(nlp, x[1]^2 - x[2] - x[4]^2 == 0)

  return nlp
end
