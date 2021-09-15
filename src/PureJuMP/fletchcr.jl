#   Source:
#   problem 32 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   CUTEst cites
#     The second problem given by
#     R. Fletcher,
#     "An optimal positive definite update for sparse Hessian matrices"
#     Numerical Analysis report NA/145, University of Dundee, 1992.
#
#     Scaled version.
#
#     SIF input: Nick Gould, Oct 1992.
#
#   as source for this problem.
#   It is possible that Fletcher may have used this problem in his
#   technical report, but the published version of his report
#
#     SIAM J. Optimization, 5(1), pp 192-218, 1995
#
#   uses the chained Rosenbrock problem, not the one below.
#
#   classification OUR2-AN-V-0
#
# J.-P. Dussault, Rennes 09/2015.

export fletchcr

function fletchcr(n::Int = 100)
  n < 2 && @warn("fletchcr: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 0.0)

  @NLobjective(nlp, Min, 100.0 * sum((x[i + 1] - x[i] + 1 - x[i]^2)^2 for i = 1:(n - 1)))

  return nlp
end
