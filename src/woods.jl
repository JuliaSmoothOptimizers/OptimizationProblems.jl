#   The extended Woods problem.

#   This problem is a sum of n/4 sets of 6 terms, each of which is
#   assigned its own group.  For a given set i, the groups are
#   A(i), B(i), C(i), D(i), E(i) and F(i). Groups A(i) and C(i) contain 1
#   nonlinear element each, denoted Y(i) and Z(i).

#   The problem dimension is defined from the number of these sets.
#   The number of problem variables is then 4 times larger.

#   This version uses a slightly unorthodox expression of Woods
#   function as a sum of squares (see Buckley)

#   Source:  problem 14 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Toint#27, Buckley#17 (p. 101), Conn, Gould, Toint#7

#   classification SUR2-AN-V-0

# See also
#
#   problem 58 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   classification SUR2-AN-V-0
#
# J.-P. Dussault, Clermont-Ferrand, 05/2016.

export woods

"The extended Woods problem `n` "
function woods(n :: Int=100)

    (n % 4 == 0) || warn("woods: number of variables adjusted to be a multiple of 4")
    n = 4 * max(1, div(n, 4))

    nlp = Model()

    x0 = -3 * ones(n)
    x0[2*(collect(1:div(n,2)))] .= -1.0

    @variable(nlp, x[i=1:n], start=-2)

    @NLobjective(
      nlp,
      Min,
      1.0 + sum(
        100 * (x[4*i-2] - x[4*i-3]^2)^2 + (1 - x[4*i-3])^2 +
        90 * (x[4*i] - x[4*i-1]^2)^2 + (1 - x[4*i-1])^2 +
        10 * (x[4*i-2] + x[4*i] - 2)^2 + 0.1 * (x[4*i-2] - x[4*i])^2 for i=1:div(n,4))
    )

    return nlp
end
