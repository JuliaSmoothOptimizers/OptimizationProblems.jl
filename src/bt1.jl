#   Source:  problem 13 (p. 103) in
#   A.R. Buckley,
#   "Test functions for unconstrained minimization",
#   TR 1989CS-3, Mathematics, statistics and computing centre,
#   Dalhousie University, Halifax (CDN), 1989.
#
#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt1.mod
#
#   classification QQR2-AN-2-1
#
# A. Cebola, Curitiba 10/2016.

export bt1

"BT1 Model"
function bt1(args...)

    nlp = Model()

    x0 = [0.08, 0.06]

    @variable(nlp, x[i=1:2], start=x0[i])

    @NLobjective(
      nlp,
      Min,
      100 * x[1]^2 + 100 * x[2]^2 - x[1] - 100
    )

    @NLconstraint(
      nlp,
      constr1,
      x[1]^2 + x[2]^2 - 1.0 == 0
    )

    return nlp
end
