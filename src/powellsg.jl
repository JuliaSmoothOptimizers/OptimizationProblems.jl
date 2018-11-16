#   The extended Powell singular problem.
#   This problem is a sum of n/4 sets of four terms, each of which is
#   assigned its own group.

#   Source:  Problem 13 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Toint#19, Buckley#34 (p.85)

#   classification OUR2-AN-V-0

#   Problem 47 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export powellsg

"The extended Powell singular problem in size 'n' "
function powellsg(n :: Int=100)

    (n % 4 == 0) || Compat.@warn("powellsg: number of variables adjusted to be a multiple of 4")
    n = 4 * max(1, div(n, 4))

    x0 = zeros(n)
    x0[4*(collect(1:div(n,4))).-3] .=  3.0
    x0[4*(collect(1:div(n,4))).-2] .= -1.0
    x0[4*(collect(1:div(n,4)))]    .=  1.0

    nlp = Model()
    @variable(nlp, x[i=1:n], start=x0[i])

    @NLobjective(
      nlp,
      Min,
      sum((x[j] + 10.0 * x[j+1])^2 + 5.0 * (x[j+2] - x[j+3])^2 + (x[j+1] - 2.0 * x[j+2])^4 + 10.0 * (x[j] - x[j+3])^4 for j=1:div(n,4))
    )

    return nlp
end
