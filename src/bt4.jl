#   Source: a variant of problem 4 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.

#   The original problem seems to be unbounded.  The contribution of
#   x3 in the first constraint has been squared instead of cubed.

#   The problem is not convex.

#   SIF input: Ph. Toint, June 1993.

#   Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt4.mod

#   classification QQR2-AN-3-2

#   D. Cabral, Curitiba, 11/2016.

export bt4

"BT4 Model"
function bt4(args...)

nlp = Model()

x0 = [4.0382, -2.9470, -0.09115]

@variable(nlp, x[i=1:3], start=x0[i])

@NLobjective(
  nlp,
  Min,
  x[1] - x[2] + x[2]^3
)

@NLconstraint(
  nlp, begin
  -25 + x[1]^2 + x[2]^2 + x[3]^2 == 0.0
  x[1] + x[2] + x[3] - 1 == 0.0
  end
)
