#   G. Li,
#   "The secant/finite difference algorithm for solving sparse
#   nonlinear systems of equations",
#   SIAM Journal on Optimization, (to appear), 1990.

#   classification SUR2-AN-V-0

#   This is a simplified version of problem NONDIA.

#   Problem 38 in
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

export liarwhd

function liarwhd(n :: Int=100)

    n < 2 && Compat.@warn("liarwhd: number of variables must be ≥ 4")
    n = max(2, n)

    nlp = Model()

    @variable(nlp, x[i=1:n], start=4.0)

    @NLobjective(
      nlp,
      Min,
	    sum(4.0*(x[i]^2 - x[1])^2 + (x[i] - 1)^2  for i=1:n)
    )

    return nlp
end
