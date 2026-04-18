export AMPGO18

"Univariate multimodal minimization problem AMPGO18"
function AMPGO18(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 0.0)

  @objective(nlp, Min, ifelse(x <= 3.0, (x - 2.0)^2, log(x - 2.0) + log(x - 2.0) + 1.0))

  return nlp
end
