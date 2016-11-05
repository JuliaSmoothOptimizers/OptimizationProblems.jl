#   Source: problem 9 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.

#   The problem is not convex.

#   SIF input: Ph. Toint, June 1993.

#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt9.mod

#   classification LOR2-AN-4-2

#   D. Cabral, Curitiba, 11/2016.

export bt9

"BT9 Model"
function bt7(args...)

nlp = Model()

@variable(nlp, x[i=1:4], start=2.0)

@NLobjective(
  nlp,
  Min,
  -x[1]
)

@NLconstraint(
  nlp, begin
  x[2] - x[1]^3 - x[3]^2 == 0.0
  -x[2] + x[1]^2 - x[4]^2 == 0.0
  end
)
