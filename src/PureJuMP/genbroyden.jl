export genbroyden

function genbroyden(; n::Int = default_nvar)
  p = 7 / 3
  nlp = Model()
  @variable(nlp, x[1:n], start = -1.0)
  @NLobjective(nlp, Min,
    abs((3 - 2 * x[1]) * x[1] - 0 - x[2] + 1)^p +
    sum(abs((3 - 2 * x[i]) * x[i] - x[i-1] - x[i+1] + 1)^p for i = 2:(n-1)) +
    abs((3 - 2 * x[n]) * x[n] - x[n-1] - 0 + 1)^p
  )
  return nlp
end
