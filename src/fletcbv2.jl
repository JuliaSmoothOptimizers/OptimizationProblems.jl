#   Source:  The first problem given by
#   R. Fletcher,
#   "An optimal positive definite update for sparse Hessian matrices"
#   Numerical Analysis report NA/145, University of Dundee, 1992.

#   Scaled version.

#   SIF input: Nick Gould, Oct 1992.

#   problem 31 in
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
# J,-P, Dussault, Rennes 09/2015.

export fletcbv2

function fletcbv2(n :: Int=100)

  n < 2 && Compat.@warn("fletcbv2: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=(i/(n+1.0)))

  h = 1.0 / (n + 1)

  @NLobjective(
    nlp,
    Min,
    0.5 * (x[1]^2 + sum((x[i] - x[i+1])^2 for i=1:n-1) + x[n]^2) -
    h^2 * sum(2 * x[i] + cos(x[i]) for i=1:n) - x[n]
  )

  return nlp
end
