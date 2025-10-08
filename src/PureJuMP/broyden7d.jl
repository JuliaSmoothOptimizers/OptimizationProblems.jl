export broyden7d

function broyden7d(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n], start = -1.0)
  @objective(nlp, Min, 0.5 * sum(x[i]^2 for i = 1:n))
  return nlp
end
