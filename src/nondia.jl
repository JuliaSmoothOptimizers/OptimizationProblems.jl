#   The Shanno nondiagonal extension of Rosenbrock function.

#   Source:
#   D. Shanno,
#   " On Variable Metric Methods for Sparse Hessians II: the New
#   Method",
#   MIS Tech report 27, University of Arizona (Tucson, UK), 1978.

#   See also Buckley #37 (p. 76) and Toint #15.

#   classification SUR2-AN-V-0

#   Problem 44 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export nondia

function nondia(n :: Int=100)

    n < 2 && Compat.@warn("nondia: number of variables must be ≥ 2")
    n = max(2, n)

    nlp = Model()
    @variable(nlp, x[i=1:n], start=-1.0)

    @NLobjective(
      nlp,
      Min,
	    (x[1] - 1.0)^2 + sum((100.0*x[1] - x[i-1]^2)^2 for i=2:n)
    )

    return nlp
end
