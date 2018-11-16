#   Problem 37 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   based on the original problem by N. Gould
#
#   classification OUR2-AN-V-0

# J.-P. Dussault, Clermont-Ferrand 05/2016.

export indef_mod

function indef_mod(n :: Int=100)

    n < 3 && Compat.@warn("indef_mod: number of variables must be ≥ 4")
    n = max(3, n)

    nlp = Model()

    @variable(nlp, x[i=1:n], start=i/(n+1))

    @NLobjective(
      nlp,
      Min,
	    100.0 * sum(sin(x[i] / 100.0) for i=1:n) + 0.5 * sum(cos(2.0 * x[i] - x[n] - x[1]) for i=2:n-1)
    )

    return nlp
end
