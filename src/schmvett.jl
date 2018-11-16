#   The Schmidt and Vetters problem.

#   This problem has N-2 trivial groups, all of which have 3 nonlinear
#   elements

#   Source:
#   J.W. Schmidt and K. Vetters,
#   "Albeitungsfreie Verfahren fur Nichtlineare Optimierungsproblem",
#   Numerische Mathematik 15:263-282, 1970.

#   See also Toint#35 and Buckley#14 (p90)

#   classification OUR2-AY-V-0

#   Problem 49 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export schmvett

"Another function with nontrivial groups and repetitious elements in size 'n' "
function schmvett(n :: Int=100)

    n < 3 && Compat.@warn("schmvett: number of variables must be ≥ 3")
    n = max(3, n)

    nlp = Model()

    @variable(nlp, x[i=1:n], start=3.0)

    @NLobjective(
      nlp,
      Min,
      sum(-(1.0 / (1.0 + (x[i] - x[i+1])^2)) - sin((pi * x[i+1] + x[i+2]) / 2.0) - exp(-((x[i] + x[i+2]) / x[i+1] - 2.0)^2) for i=1:n-2)
    )

    return nlp
end
