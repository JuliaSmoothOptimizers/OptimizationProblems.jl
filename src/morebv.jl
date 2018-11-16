#   The Boundary Value problem.
#   This is the nonlinear least-squares version without fixed variables.

#   Source:  problem 28 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Buckley#17 (p. 75).

#   classification SUR2-MN-V-0

#   Problem 39 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export morebv

function morebv(n :: Int=100)

    # indices in Luksan go from 0 to n+1
    n < 2 && Compat.@warn("morebv: number of variables must be ≥ 4")
    n = max(2, n)

    h = 1.0/(n-1)

    x0 = 0.5 * ones(n)
    x0[1] = 0.0
    x0[n] = 0.0

    nlp = Model()

    @variable(nlp, x[i=1:n], start=x0[i])

    @NLobjective(
      nlp,
      Min,
	    sum((2.0 * x[i] - x[i-1] - x[i+1] + (h^2 / 2.0) * (x[i] + (i - 1) * h + 1)^3)^2 for i=2:n-1)
    )

    return nlp
end
