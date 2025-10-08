export prob12_browngen

function prob12_browngen(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n], start = 0.5)
  @objective(nlp, Min, sum((x[i] - 0.5)^2 for i = 1:n))
  return nlp
end
