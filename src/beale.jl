#   Source: Problem 5 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#
#   See also Buckley#89.
#   SIF input: Ph. Toint, Dec 1989.
#
#   classification SUR2-AN-2-0
#
# A. Cebola, Curitiba 10/2016.

export beale

"Beale Model"
function beale(args...)

    nlp = Model()

    @variable(nlp, x[i=1:2], start=1.0)

    @NLobjective(
      nlp,
      Min,
      (1.5 + x[1] * (1.0 - x[2]))^2 + (2.25 + x[1] * (1.0 - x[2]^2))^2 + (2.625 + x[1] * (1.0 - x[2]^3))^2
    )

    return nlp
end
