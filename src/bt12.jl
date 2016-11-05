#   Source: problem 12 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.

#   The problem is not convex.

#   SIF input: Ph. Toint, June 1993.

#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt12.mod

#   classification QQR2-AN-5-3

#   D. Cabral, Curitiba, 11/2016.

export bt12

"BT12 Model"
function bt12(args...)

nlp = Model()

x0 = [15.811, 1.5811, 0.0, 15.083, 3.7164]

@variable(nlp, x[i=1:5], start=x0[i])

@NLobjective(
  nlp,
  Min,
  0.01 * x[1]^2 + x[2]^2
)

@NLconstraint(
  nlp, begin
  x[1] + x[2] - x[3]^2 == 25.0
  x[1]^2 + x[2]^2 - x[4]^2 == 25.0
  x[1] - x[5]^2 == 2.0
  end
)
