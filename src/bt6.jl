#   Source: problem 6 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.

#   The problem is not convex.

#   SIF input: Ph. Toint, June 1993.

#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt6.mod

#   classification OOR2-AY-5-2

#   D. Cabral, Curitiba, 11/2016.

export bt6

"BT6 Model"
function bt6(args...)

nlp = Model()

  @variable(nlp, x[i=1:5], start=2.0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 1.0)^2 + (x[1] - x[2])^2 + (x[3] - 1.0)^2 + (x[4] - 1.0)^4 + (x[5] - 1.0)^6
  )

  @NLconstraint(
    nlp, begin
    x[4] * x[1]^2 + sin(x[4] - x[5]) == 2 * sqrt(2.0)
    x[3]^4 * x[2]^2 + x[2] == 8 + sqrt(2.0)
    end
  )
