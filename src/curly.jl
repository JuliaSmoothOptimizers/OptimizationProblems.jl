# A banded function with semi-bandwidth b and
# negative curvature near the starting point.
#
# Note that the initial point in the reference below is erroneous.
# In this model, we use the starting point specified in the
# original SIF model, part of the CUTE collection.
#
# See also
#
#   problems 8, 9, 10 in
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

export curly, curly10, curly20, curly30

"Curly function in size `n` with semi-bandwidth `b`"
function curly(n :: Int=100; b :: Int=10)

  n < 2 && Compat.@warn("curly: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  x0 = [1.0e-4 * i /(n+1) for i = 1:n]

  @variable(nlp, x[i=1:n], start=x0[i])

  @NLexpression(nlp, f[i=1:n], sum(x[j] for j=i:min(i+b,n)))

  @NLobjective(
    nlp,
    Min,
    sum(f[i] * (f[i] * (f[i]^2 - 20) - 0.1) for i = 1:n)
  )

  return nlp
end

"Curly function in size `n` with semi-bandwidth 10"
curly10(n :: Int=100) = curly(n, b=10)

"Curly function in size `n` with semi-bandwidth 20"
curly20(n :: Int=100) = curly(n, b=20)

"Curly function in size `n` with semi-bandwidth 30"
curly30(n :: Int=100) = curly(n, b=30)
