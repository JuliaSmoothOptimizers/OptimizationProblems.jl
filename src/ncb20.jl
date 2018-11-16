#   A banded problem with semi-bandwidth 20.  This problem exhibits frequent
#   negative curvature in the exact Hessian.

#   Source:
#   Ph. Toint, private communication, 1992.

#   classification OUR2-AN-V-0

#   Problem 40 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export ncb20

function ncb20(n :: Int=100)

    # indices in Luksan go from 0 to n+1
    n < 31 && Compat.@warn("ncb20: number of variables must be ≥ 31")
    n = max(31, n)

    h = 1.0/ (n - 1)

    x0 = ones(n)
    x0[1:n-10] .= 0.0

    nlp = Model()
    @variable(nlp, x[i=1:n], start=x0[i])

    @NLobjective(
      nlp,
      Min,
	    2.0 +
	    sum((10.0 / i) * (sum(x[i + j - 1] / (1 + x[i + j - 1]^2) for j=1:20))^2 - 0.2 * sum(x[ i + j - 1] for j=1:20) for i=1:n-30) +
      sum(x[i]^4 + 2 for i=1:n-10) +
      1.0e-4 * sum(x[i] * x[i + 10] * x[i + n - 10] + 2.0 * x[i + n - 10]^2 for i=1:10)
    )

    return nlp
end
