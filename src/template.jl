#
#
# Source:
#
# See also
#
#   problems 11, 12, 13, 14 in
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

"model in size `n`"
function (n :: Int=100)

  n < 2 && error(": number of variables must be ≥ 2")

  nlp = Model()

  @variable(nlp, x[i=1:n], start=0)

  @NLobjective(
    nlp,
    Min,
    sum(
       for i=1:n-1
    )
  )

  return nlp
end

