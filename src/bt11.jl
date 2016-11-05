#   Source: problem 11 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.

#   The problem is not convex.

#   SIF input: Ph. Toint, June 1993.

#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt11.mod

#   classification OOR2-AY-5-3

#   D. Cabral, Curitiba, 11/2016.

export bt11

"BT11 Model"
function bt11(args...)

nlp = Model()

@variable(nlp, x[i=1:5], start=2.0)

@NLobjective(
  nlp,
  Min,
  (x[1] - 1.0)^2 + (x[1] - x[2])^2 + (x[2] - x[3])^2 + (x[3] - x[4])^4 + (x[4] - x[5])^4
)

@NLconstraint(
  nlp, begin
  x[1] + x[2]^2 + x[3]^3 == -2 + sqrt(18.0)
  x[2] + x[4] - x[3]^2 == -2 + sqrt(8.0)
  x[1] - x[5] == 2.0
  end
)
