# The cosine function.
#
#   Source: problem 6 in
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

export cosine

"The cosine function in size `n`"
function cosine(n :: Int=100)

  n < 2 && Compat.@warn("cosine: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=1)

  @NLobjective(
    nlp,
    Min,
    sum(cos(x[i]^2 - 0.5 * x[i+1]) for i = 1:n-1)
  )

  return nlp
end
