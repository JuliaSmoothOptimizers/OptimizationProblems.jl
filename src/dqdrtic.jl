#   Diagonal quadratic problem
#
#   Source: problem 22 in
#   Ph. L. Toint,
#   "Test problems for partially separable optimization and results
#   for the routine PSPMIN",
#   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.
#
#   classification QUR2-AN-V-0

export dqdrtic

"Diagonal quadratic problem"
function dqdrtic(n::Int=5000)

  nlp = Model()

  @variable(nlp, x[j=1:n], start=3.0)

  @NLobjective(
    nlp,
    Min,
    sum(x[i]^2 + 100 * (x[i+1]^2 + x[i+2]^2) for i=1:n-2)
  )

  return nlp
end
