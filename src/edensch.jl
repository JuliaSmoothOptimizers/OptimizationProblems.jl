#   The extended Dennis and Schnabel problem, as defined by Li.
#
#   Source:
#   G. Li,
#   The secant/finite difference algorithm for solving sparse
#   nonlinear systems of equations,
#   SIAM Journal on Numerical Analysis, 25(5), pp. 1181-1196, 1988.
#
# See also
#
#   problem 24 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   classification OUR2-AN-V-0
#
# D. Orban, Montreal, 08/2015.

export edensch

"Extended Dennis-Schnabel model in size `n`"
function edensch(n :: Int=100)

  n < 2 && Compat.@warn("edensch: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=0)

  @NLobjective(
    nlp,
    Min,
    16 +
    sum(
      (x[i] - 2)^4 + (x[i] * x[i+1] - 2 * x[i+1])^2 + (x[i+1] + 1)^2
      for i=1:n-1
    )
  )

  return nlp
end
