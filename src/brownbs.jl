#   Source: Problem 4 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#
#   See also Buckley#25
#   SIF input: Ph. Toint, Dec 1989.
#
#   classification SUR2-AN-2-0
#
# A. Cebola, Curitiba 10/2016.

export brownbs

"Brownbs Model"
function brownbs(args...)

    nlp = Model()

    @variable(nlp, x[i=1:2], start=1.0)

    @NLobjective(
      nlp,
      Min,
      (x[1] - 1e6)^2 + (x[2] - 2 * 1e-6)^2 + (x[1] * x[2] - 2)^2
    )

    return nlp
end
