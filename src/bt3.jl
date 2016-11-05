#   Source: problem 3 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.

#   The problem is convex.

#   SIF input: Ph. Toint, June 1993.

#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt3.mod

#   classification SLR2-AY-5-3

#   D. Cabral, Curitiba, 11/2016.

export bt3

"BT3 Model"
function bt3(args...)

nlp = Model()

  @variable(nlp, x[i=1:5], start=20.0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - x[2])^2 + (x[2] + x[3] - 2)^2 + (x[4] - 1)^2 + (x[5] - 1)^2
  )

  @NLconstraint(
    nlp, begin
    x[1] + 3 * x[2] == 0.0
    x[3] + x[4] - 2 * x[5] == 0.0
    x[2] - x[5] == 0.0
    end
  )
