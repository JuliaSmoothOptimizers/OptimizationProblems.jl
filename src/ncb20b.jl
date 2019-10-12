#   A banded problem with semi-bandwidth 20.  This problem exhibits frequent
#   negative curvature in the exact Hessian.  It is a simplified version of
#   problem NCB20.

#   Source:
#   Ph. Toint, private communication, 1992.

#   classification OUR2-AN-V-0

#   Problem 41 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export ncb20b

function ncb20b(n :: Int=100)

    # indices in Luksan go from 0 to n+1
    n < 20 && @warn("ncb20b: number of variables must be ≥ 20")
    n = max(20, n)

    x0 = zeros(n)

    nlp = Model()
    @variable(nlp, x[i=1:n], start=x0[i])

    @NLobjective(
      nlp,
      Min,
	    sum((10.0 / i) * (sum(x[i+j-1] / (1 + x[i+j-1]^2) for j=1:20))^2 - 0.2 * sum(x[i+j-1] for j=1:20) for i=1:n-19) +
      sum(100.0 * x[i]^4 + 2.0 for i=1:n)
    )

    return nlp
end
