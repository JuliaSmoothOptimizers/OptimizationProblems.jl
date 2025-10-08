export nazareth

function nazareth(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n], start = 0.0)
  @objective(nlp, Min, sum((sin(x[i]) - 0.1)^2 for i = 1:n))
  return nlp
end
