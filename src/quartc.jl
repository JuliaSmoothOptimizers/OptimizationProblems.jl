#   A simple quartic function.
#
#   Source:  problem 157 (p. 87) in
#   A.R. Buckley,
#   "Test functions for unconstrained minimization",
#   TR 1989CS-3, Mathematics, statistics and computing centre,
#   Dalhousie University, Halifax (CDN), 1989.
#
#   classification OUR2-AN-V-0

export quartc

"A simple quartic function."
function quartc(n::Int=10000)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=2.0)

  @NLobjective(
    nlp,
    Min,
    sum((x[i] - i)^4 for i=1:n)
  )

  return nlp
end
