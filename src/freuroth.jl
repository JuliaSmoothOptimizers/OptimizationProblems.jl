#   Source: problem 2 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Toint#33, Buckley#24
#   SIF input: Ph. Toint, Dec 1989.

#   classification SUR2-AN-V-0
#
#   problem 36 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   classification SUR2-AN-V-0
# J.-P. Dussault, Rennes 09/2015.

export freuroth

function freuroth(n :: Int = 100)
    n < 2 && Compat.@warn("freuroth: number of variables must be ≥ 2")
    n = max(2, n)

    ngs = n - 1
    x0 = zeros(n)
    x0[1] = 0.5
    x0[2] = -2.0

    nlp = Model()

    @variable(nlp, x[i=1:n], start=x0[i])

    @NLobjective(
      nlp,
      Min,
	    sum(((5.0 - x[i+1]) * x[i+1]^2 + x[i] - 2 * x[i+1] - 13.0)^2 for i=1:ngs) +
	    sum(((1.0 + x[i+1]) * x[i+1]^2 + x[i] - 14 * x[i+1] - 29.0)^2 for i=1:ngs)
     )

    return nlp
end
