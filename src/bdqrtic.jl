# A quartic with a banded Hessian of bandwidth 9
#
#   Source:
#   Problem 61 in
#   A.R. Conn, N.I.M. Gould, M. Lescrenier and Ph.L. Toint,
#   Performance of a multifrontal scheme for partially separable
#   optimization,
#   Report 88/4, Dept of Mathematics, FUNDP (Namur, B), 1988.
#
# See also
#
#   problem 2 in
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
# D. Orban, Montreal, 08/2015.

export bdqrtic

"Banded quartic model in size `n`"
function bdqrtic(n :: Int=100)

  n < 5 && @warn("bdqrtic: number of variables must be ≥ 5")
  n = max(5, n)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=1.0)

  @NLobjective(
    nlp,
    Min,
    sum((3 - 4 * x[i])^2 + (x[i]^2 + 2 * x[i+1]^2 + 3 * x[i+2]^2 + 4 * x[i+3]^2 + 5 * x[n]^2)^2 for i=1:n-4)
  )

  return nlp
end
