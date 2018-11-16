#   Source: problem 10 in
#   Ph.L. Toint,
#   "Test problems for partially separable optimization and results
#   for the routine PSPMIN",
#   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

#   See also Buckley#116.  Note that MGH#21 is the separable version.
#   SIF input: Ph. Toint, Dec 1989.

#   problem 29 in
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
# J.-P. Dussault, Rennes 09/2015.

export extrosnb

function extrosnb(n :: Int=100)

  n < 2 && Compat.@warn("extrosnb: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=-1.0) # Strange to start at the solution?

  @NLobjective(
    nlp,
    Min,
    100.0 * sum((x[i] - x[i - 1]^2)^2 for i=2:n) + (1.0 - x[1])^2
  )

  return nlp
end
