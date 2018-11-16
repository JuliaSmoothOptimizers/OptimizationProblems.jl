#   Broyden banded system of nonlinear equations, considered in the
#   least square sense.
#   NB: scaled version of BRYBND

#   Source: problem 31 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Buckley#73 (p. 41) and Toint#18

#   classification SUR2-AN-V-0

#   Problem 48 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# The terms in the sum should be squared --- corrected
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export sbrybnd

"Broyden banded system of nonlinear equations in size 'n' "
function sbrybnd(n :: Int=100)

    n < 2 && Compat.@warn("sbrybnd: number of variables must be ≥ 2")
    n = max(2, n)

    nlp = Model()
    p = zeros(n)
    J = Array{Any}(undef, n)
    for i=1:n
      p[i] = exp(6.0*(i-1)/(n-1))
      J[i] = [max(1, i-5):i-1; i+1:min(n, i+1)]
    end

    @variable(nlp, x[i=1:n], start=1.0/p[i])

    @NLobjective(
      nlp,
      Min,
      sum(((2.0 + 5.0 * p[i]^2 * x[i]^2) * p[i] * x[i] + 1.0 - sum(p[j] * x[j] * (1.0 + p[j] * x[j]) for j=J[i]))^2 for i=1:n)
    )

    return nlp
end
