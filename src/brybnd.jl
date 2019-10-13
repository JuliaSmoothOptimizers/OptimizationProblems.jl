# Broyden banded system of nonlinear equations, considered in the
# least square sense.
#
#   Source:
#   problem 31 in
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom,
#   Testing Unconstrained Optimization Software,
#   ACM Transactions on Mathematical Software,
#   vol. 7(1), pp. 17-41, 1981.
#   http://dx.doi.org/10.1145/355934.355936
#
#   See also Buckley#73 (p. 41) and Toint#18
#
# The system in question is described in
#
#   C. G. Broyden,
#   A class of methods for solving nonlinear simultaneous
#   equations,
#   Mathematics of Computation, vol. 19, 577-593, 1965.
#   http://dx.doi.org/10.1090/S0025-5718-1965-0198670-6#sthash.I3Dmi8yu.dpuf
#
# See also
#
#   problem 4 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# Moré, Garbow and Hillstrom leave ml and mu as parameters.
# Luksan, Matonoha and Vlcek do not.
#
#   classification SUR2-AN-V-0
#
# D. Orban, Montreal, 08/2015.

# Note: discrepancy with CUTEst appears to be a bug in CUTEst, this matches the original paper
# (See issue #36)

export brybnd

"Broyden banded model in size `n`"
function brybnd(n :: Int=100; ml :: Int=5, mu :: Int=1)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=(-1.0))

  @NLobjective(
    nlp,
    Min,
    sum(
      (
        x[i] * (2 + 5 * x[i]^2) + 1 -
        sum(
          x[j] * (1 + x[j])
          for j = max(1, i-ml) : min(n, i+mu) if j != i
        )
      )^2 for i=1:n
    )
  )

  return nlp
end
