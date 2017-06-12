#   Dixon's tridiagonal quadratic.
#
#   Source: problem 156 (p. 51) in
#   A.R. Buckley,
#   "Test functions for unconstrained minimization",
#   TR 1989CS-3, Mathematics, statistics and computing centre,
#   Dalhousie University, Halifax (CDN), 1989.
#
#   classification QUR2-AN-V-0

export dixon3dq

"Dixon's tridiagonal quadratic."
function dixon3dq(n::Int=10)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=-1.0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 1.0)^2 + (x[n] - 1.0)^2 + sum((x[i] - x[i+1])^2 for i=2:n-1)
  )

  return nlp

end
