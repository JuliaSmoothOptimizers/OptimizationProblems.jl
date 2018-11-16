# Arrow head problem.
# A quartic problem whose Hessian is an arrow-head (downwards) with
# diagonal central part and border-width of 1.
#
#   Source:
#   Problem 55 in
#   A.R. Conn, N.I.M. Gould, M. Lescrenier and Ph.L. Toint,
#   Performance of a multifrontal scheme for partially separable
#   optimization,
#   Report 88/4, Dept of Mathematics, FUNDP (Namur, B), 1988.
#
# See also
#
#   problem 1 in
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

export arwhead

"Arrow head model in size `n`"
function arwhead(n :: Int=100)

  n < 2 && Compat.@warn("arwhead: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=1.0)

  @NLobjective(
    nlp,
    Min,
    sum((x[i]^2 + x[n]^2)^2 - 4 * x[i] + 3 for i=1:n-1)
  )

  return nlp
end
