# Generalized Broyden Tridiagonal Function
#
#   Problem 5 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
export genbroydentri

function genbroydentri(; n::Int = default_nvar)
  p = 7 / 3
  nlp = Model()
  @variable(nlp, x[1:n], start = -1.0)
  @objective(
    nlp,
    Min,
    abs((3 - 2 * x[1]) * x[1] - 0 - x[2] + 1)^p +
    sum(abs((3 - 2 * x[i]) * x[i] - x[i - 1] - x[i + 1] + 1)^p for i = 2:(n - 1)) +
    abs((3 - 2 * x[n]) * x[n] - x[n - 1] - 0 + 1)^p
  )
  return nlp
end
