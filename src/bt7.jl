#   Source: problem 7 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.

#   The problem is not convex.

#   SIF input: Ph. Toint, June 1993.

#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt7.mod

#   classification OQR2-AN-5-3

#   D. Cabral, Curitiba, 11/2016.

export bt7

"BT7 Model"
function bt7(args...)

nlp = Model()

x0 = [-2.0, -1.0, -1.0, -1.0, -1.0]

@variable(nlp, x[i=1:5], start=x0[i])

@NLobjective(
  nlp,
  Min,
  100 * (x[2] - x[1]^2)^2 + (x[1] - 1.0)^2
)

@NLconstraint(
  nlp, begin
  x[1] * x[2] - x[3]^2 == 1.0
  x[2]^2 - x[4]^2 + x[1] == 0.0
  x[5]^2 + x[1] == 0.5
  end
)
