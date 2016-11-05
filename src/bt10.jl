#   Source: problem 10 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.

#   The problem is not convex.

#   SIF input: Ph. Toint, June 1993.

#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt10.mod

#   classification LOR2-AN-2-2

#   D. Cabral, Curitiba, 11/2016.

export bt10

"BT10 Model"
function bt10(args...)

nlp = Model()

@variable(nlp, x[i=1:2], start=2.0)

@NLobjective(
  nlp,
  Min,
  -x[1]
)

@NLconstraint(
  nlp, begin
  x[2] - x[1]^3 == 0.0
  -x[2] + x[1]^2 == 0.0
  end
)
