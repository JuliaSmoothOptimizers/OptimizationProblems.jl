export browngen

function browngen(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n], start = 0.5)
  @NLexpression(nlp, sx, sum(x[i] for i = 1:n))
  @NLexpression(nlp, px, prod(x[i] for i = 1:n))
  @NLobjective(nlp, Min, sum((x[i] + sx - (n + 1))^2 for i = 1:(n - 1)) + (px - 1)^2)
  return nlp
end
