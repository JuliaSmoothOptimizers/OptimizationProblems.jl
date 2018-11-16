#   A nondiagonal quartic test problem.

#   This problem has an arrow-head type Hessian with a tridiagonal
#   central part and a border of width 1.
#   The Hessian is singular at the solution.

#   Source: problem 57 in
#   A.R. Conn, N.I.M. Gould, M. Lescrenier and Ph.L. Toint,
#   "Performance of a multi-frontal scheme for partially separable
#   optimization"
#   Report 88/4, Dept of Mathematics, FUNDP (Namur, B), 1988.

#   classification OUR2-AN-V-0

#   Problem 45 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export nondquar

function nondquar(n :: Int=100)

    n < 2 && Compat.@warn("nondquar: number of variables must be ≥ 2")
    n = max(2, n)

    x0 = ones(n)
    x0[2 * collect(1:div(n, 2))] .= -1.0

    nlp = Model()
    @variable(nlp, x[i=1:n], start=x0[i])

    @NLobjective(
      nlp,
      Min,
	    (x[1] - x[2])^2 + (x[n-1] - x[n])^2 + sum((x[i] + x[i+1] + x[n])^4 for i=1:n-2)
    )

    return nlp
end
