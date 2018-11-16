#   A nonconvex unconstrained function with a unique minimum value

#   classification OUR2-AN-V-0

#   Problem 43 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export noncvxu2

function noncvxu2(n :: Int=100)

    n < 2 && Compat.@warn("noncvxu2: number of variables must be ≥ 2")
    n = max(2, n)

    nlp = Model()
    @variable(nlp, x[i=1:n], start=i)

    @NLobjective(
      nlp,
      Min,
	    sum((x[i] + x[mod(3 * i - 2, n) + 1] + x[mod(7 * i - 3, n) + 1])^2 +
      4.0 * cos(x[i] + x[mod(3 * i - 2, n) + 1] + x[mod(7 * i - 3, n) + 1]) for i=1:n)
    )

    return nlp
end
