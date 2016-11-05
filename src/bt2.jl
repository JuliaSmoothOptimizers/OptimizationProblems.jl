#   Source: problem 2 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.

#   SIF input: Ph. Toint, June 1993.

#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt2.mod

#   classification QQR2-AY-3-1

#   D. Cabral, Curitiba, 11/2016.

export bt2

"BT2 Model"
function bt2(args...)

nlp = Model()

  @variable(nlp, x[i=1:3], start=10.0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 1.0)^2 + (x[1] - x[2])^2 + (x[2] - x[3])^4
  )

  @NLconstraint(
    nlp,
    constr1,
    x[1] * (1.0 + x[2]^2) + x[3]^4 == 8.2426407
  )

  return nlp
end
