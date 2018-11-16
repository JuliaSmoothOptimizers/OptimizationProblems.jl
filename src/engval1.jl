# The ENGVAL1 problem.
#
#   Source: problem 31 in
#   Ph.L. Toint,
#   Test problems for partially separable optimization and results
#   for the routine PSPMIN,
#   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.
#
# See also
#
#   problem 26 in
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

export engval1

"The Engval1 model in size `n`"
function engval1(n :: Int=100)

  n < 2 && Compat.@warn("engval1: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=2)

  @NLobjective(
    nlp,
    Min,
    sum(
      (x[i]^2 + x[i+1]^2)^2 - 4 * x[i] + 3
      for i=1:n-1
    )
  )

  return nlp
end
