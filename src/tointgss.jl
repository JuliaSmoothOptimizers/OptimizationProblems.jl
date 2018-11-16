#   Toint's Gaussian problem.

#   This problem has N-2 trivial groups, all of which have 1 nonlinear
#   element

#   Source: problem 21 in
#   Ph.L. Toint,
#   "Test problems for partially separable optimization and results
#   for the routine PSPMIN",
#   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

#   classification OUR2-AY-V-0

#   Problem 56 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export tointgss

"Toint's Gaussian problem in size 'n' "
function tointgss(n :: Int=100)

    n < 3 && Compat.@warn("tointgss: number of variables must be ≥ 3")
    n = max(3, n)

    nlp = Model()

    @variable(nlp, x[i=1:n], start=3.0)

    @NLobjective(
      nlp,
      Min,
      sum((10.0 / (n + 2) + x[i+2]^2) * (2.0 - exp(-(x[i] - x[i+1])^2 / (0.1 + x[i+2]^2))) for i=1:n-2)
    )

    return nlp
end
