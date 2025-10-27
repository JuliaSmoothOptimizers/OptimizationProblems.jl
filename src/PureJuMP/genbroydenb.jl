# Generalized Broyden banded function
#
#   Problem 6 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
export genbroydenb

function genbroydenb(; n::Int = default_nvar)
  p = 7 / 3
  nlp = Model()
  @variable(nlp, x[1:n], start = -1.0)
  @objective(
    nlp,
    Min,
    sum(
      abs(
        (2 + 5 * x[i]^2) * x[i] +
        1 +
        sum(x[j] * (1 + x[j]) for j = max(1, i - 5):min(n, i + 1) if j != i),
      )^p for i = 1:n
    )
  )
  return nlp
end
