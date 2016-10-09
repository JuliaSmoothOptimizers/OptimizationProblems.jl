#   Source:  problem 13 (p. 103) in
#   A.R. Buckley,
#   "Test functions for unconstrained minimization",
#   TR 1989CS-3, Mathematics, statistics and computing centre,
#   Dalhousie University, Halifax (CDN), 1989.
#
#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute
#
#   classification QQR2-AN-2-1
#
#   A. Cebola, Paraná 10/2016.

export bt01

'BT01 Model'

function bt01(args...)

    nlp = Model()
    x0 = [0.08, 0.06]

    M = 13

    @variable(nlp, x[i=1:2], start=x0[i])

    @NLobjective(
      nlp,
      Min,
      100*x[1]^2+100*x[2]^2-x[1]-100
    )

    @NLconstraint(
      nlp,
      constr1,
      x[1]^2+x[2]^2-1.0 ==0
    )

    return nlp
end
