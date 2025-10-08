export prob09_trig

function prob09_trig(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n], start = 0.0)
  @objective(nlp, Min, sum((sin(x[i]) + 0.5 * x[i])^2 for i = 1:n))
  return nlp
end
