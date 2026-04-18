export hs110

"HS110 model"
function hs110(args...; kwargs...)
  nlp = Model()
  @variable(nlp, 2.001 ≤ x[i = 1:10] ≤ 9.999, start = 9)

  @objective(
    nlp,
    Min,
    sum(log(x[i] - 2)^2 + log(10 - x[i])^2 for i = 1:10) - prod(x[i] for i = 1:10)^0.2
  )

  return nlp
end
