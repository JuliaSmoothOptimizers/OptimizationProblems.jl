export auglag

function auglag(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n], start = 1.0)
  @NLexpression(nlp, s_exp, sum(exp(x[j]) for j = 1:n))
  @NLexpression(nlp, s_sq, sum(x[j]^2 for j = 1:n))
  @NLexpression(nlp, p, prod(x[j] for j = 1:n))
  @NLobjective(nlp, Min, s_exp + s_sq + (p - 1)^2)
  return nlp
end
