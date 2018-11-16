#   A penalty problem by Gill, Murray and Pitfield.
#   It has a dense Hessian matrix.

#   Source:  problem 114 (p. 81) in
#   A.R. Buckley,
#   "Test functions for unconstrained minimization",
#   TR 1989CS-3, Mathematics, statistics and computing centre,
#   Dalhousie University, Halifax (CDN), 1989.

#   classification OUR2-AY-V-0

#   Problem 46 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export penalty3

"A penalty problem by Gill, Murray and Pitfield in size 'n' "
function penalty3(n :: Int=100)

    n < 3 && Compat.@warn("penalty3: number of variables must be ≥ 3")
    n = max(3, n)

    nlp = Model()
    @variable(nlp, x[i=1:n], start=i/(n+1))

    @NLobjective(
      nlp,
      Min,
      1.0 + sum((x[i] - 1.0)^2 for i=1:div(n,2)) +
      exp(x[n]) * sum((x[i] + 2.0 * x[i+1] + 10.0 * x[i+2] - 1.0)^2 for i=1:n-2) +
      sum((x[i] + 2.0 * x[i+1] + 10.0 * x[i+2] - 1.0)^2 for i=1:n-2) * sum((2.0 * x[i] + x[i+1] - 3.0)^2 for i=1:n-2) +
      exp(x[n-1]) * sum((2.0 * x[i] + x[i+1] - 3.0)^2 for i=1:n-2) +
      (sum(x[i]^2 - n for i=1:n))^2
    )

    return nlp
end
