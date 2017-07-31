#   The "cliff problem" in 2 variables
#
#   Source:  problem 206 (p. 46) in
#   A.R. Buckley,
#   "Test functions for unconstrained minimization",
#   TR 1989CS-3, Mathematics, statistics and computing centre,
#   Dalhousie University, Halifax (CDN), 1989.
#
#  classification OUR2-AN-2-0

export cliff

"The 'cliff problem' in 2 variables"
function cliff(args...)

  nlp = Model()

  x0 = [0.0, -1]

  @variable(nlp, x[i=1:2], start=x0[i])

  @NLobjective(
    nlp,
    Min,
    (0.01 * x[1] - 0.03)^2 - x[1] + x[2] + exp(20 * (x[1] - x[2]))
  )

  return nlp

end
