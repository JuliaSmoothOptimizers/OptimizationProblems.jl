export prob11_auglag

function prob11_auglag(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n], start = 0.0)
  @objective(nlp, Min, sum((x[i] - 1)^2 for i = 1:n))
  return nlp
end
