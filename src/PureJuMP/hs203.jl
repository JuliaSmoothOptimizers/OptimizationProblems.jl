export hs203

"HS203 model (Beale function)"
function hs203(; n::Int = default_nvar, kwargs...)
  nlp = Model()
  @variable(nlp, x1, start = 2)
  @variable(nlp, x2, start = 0.2)
  @objective(
    nlp,
    Min,
    (1.5 - x1 * (1 - x2))^2 + (2.25 - x1 * (1 - x2^2))^2 + (2.625 - x1 * (1 - x2^3))^2,
  )
  return nlp
end
