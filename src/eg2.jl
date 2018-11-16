# A simple non convex problem with several local minima.
#
#   Source: Section 1.2.4 of
#   A. R. Conn, N. I. M. Gould and Ph. L. Toint,
#   LANCELOT, A Fortran Package for Large-Scale Nonlinear Optimization
#   (Release A)
#   Springer Verlag, 1992.
#
# See also
#
#   problem 25 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   classification OUR2-AN-1000-0
#
# D. Orban, Montreal, 08/2015.

export eg2

"model in size `n`"
function eg2(n :: Int=100)

  n < 2 && Compat.@warn("eg2: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=0)

  @NLobjective(
    nlp,
    Min,
    sum(
      sin(x[1] + x[i]^2 - 1)
      for i=1:n-1
    ) +
    0.5 * sin(x[n]^2)
  )

  return nlp
end
