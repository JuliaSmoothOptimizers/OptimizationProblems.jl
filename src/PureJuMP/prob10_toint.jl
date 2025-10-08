export prob10_toint

function prob10_toint(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n], start = 0.0)
  @objective(nlp, Min, sum((cos(x[i]) - x[i]^2)^2 for i = 1:n))
  return nlp
end
