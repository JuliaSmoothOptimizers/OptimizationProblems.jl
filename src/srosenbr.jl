#   The separable extension of Rosenbrock's function.

#   Source:  problem 21 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   classification SUR2-AN-V-0

#   Problem 55 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export srosenbr

"The separable extension of Rosenbrock's function 'n' "
function srosenbr(n :: Int=100)

  (n % 2 == 0) || Compat.@warn("srosenbr: number of variables adjusted to be even")
  n = 2 * max(1, div(n, 2))

  x0 = ones(n)
  x0[2*(collect(1:div(n,2))).-1] .= -1.2
  nlp = Model()

  @variable(nlp, x[i=1:n], start=x0[i])

  @NLobjective(
    nlp,
    Min,
    sum(100.0 * (x[2*i] - x[2*i-1]^2)^2  + (x[2*i-1] - 1.0)^2 for i=1:div(n, 2))
  )

  return nlp
end
