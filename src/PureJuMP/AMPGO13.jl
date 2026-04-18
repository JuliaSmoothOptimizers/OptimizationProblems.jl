export AMPGO13

"Univariate multimodal minimization problem AMPGO13"
function AMPGO13(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 0.001)

  @objective(nlp, Min, ifelse(0.0 < x < 1.0, -(x^(2 / 3) + (1 - x^2)^(1 / 3)), Inf))

  return nlp
end
