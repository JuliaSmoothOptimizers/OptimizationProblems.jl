export hs202

"HS202 model (Freudenstein-Roth function)"
function hs202(; n::Int = default_nvar, kwargs...)
  nlp = Model()
  @variable(nlp, x1, start = 15)
  @variable(nlp, x2, start = -2)
  @objective(
    nlp,
    Min,
    (-13 + x1 + ((5 - x2) * x2 - 2) * x2)^2 + (-29 + x1 + ((1 + x2) * x2 - 14) * x2)^2,
  )
  return nlp
end
