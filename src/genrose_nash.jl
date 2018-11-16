# Generalized Rosenbrock function.
#
#   Source: problem 4 in
#   S. Nash,
#   Newton-type minimization via the Lanczos process,
#   SIAM J. Num. Anal. 21, 770-788, 1984,
#
# and
#
#   problem 36 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   classification SUR2-AN-V-0
#
# Note: this variant does not reduce to the classical
# Rosenbrock function when n = 2, described in
#
#   H. H. Rosenbrock,
#   An automatic method for finding the greatest or least value
#   of a function
#   The Computer Journal 3: 175–184, 1960.
#   https://dx.doi.org/10.1093%2Fcomjnl%2F3.3.175
#
# D. Orban, Montreal, 08/2015.

export genrose_nash

"Nash's variant of `genrose()` in size `n`"
function genrose_nash(n :: Int=100)

  n < 2 && Compat.@warn("genrose_nash: number of variables must be ≥ 2")
  n = max(2,n)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=(i/(n+1)))

  @NLobjective(
    nlp,
    Min,
    1.0 + 100 * sum((x[i] - x[i-1]^2)^2 for i=2:n) + sum((1.0 - x[i])^2 for i=2:n)
  )

  return nlp
end

