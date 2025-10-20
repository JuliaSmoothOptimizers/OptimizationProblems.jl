export genbroydenb

function genbroydenb(; n::Int = default_nvar)
  p = 7 / 3
  nlp = Model()
  @variable(nlp, x[1:n], start = -1.0)
  @NLobjective(nlp, Min,
    sum(
      abs((2 + 5 * x[i]^2) * x[i] + 1 +
          sum(x[j] * (1 + x[j]) for j = max(1, i - 5):min(n, i + 1) if j != i)
      )^p
      for i = 1:n
    )
  )
  return nlp
end
