#   Source: problem 1 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.
#
#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/zangwil3.mod
#
#   classification  NLR2-AN-3-3
#
# A. Cebola, Paraná 10/2016.

export zangwil3

"Zangwil3 Model"
function zangwil3(args...)

    nlp = Model()

    x0 = [100.0, -1.0, 2.5]

    @variable(nlp, x[i=1:3], start=x0[i])

    @NLobjective(
      nlp,
      Min,
      0
    )

    @NLconstraint(
      nlp,
      constr1,
      x[1] - x[2] + x[3] == 0
    )

    @NLconstraint(
      nlp,
      constr2,
      -x[1] + x[2] + x[3] == 0
    )

    @NLconstraint(
      nlp,
      constr3,
      x[1] + x[2] - x[3] == 0
    )
    return nlp
end
