# Hock and Schittkowski problem number 99.
#
#   Source:
#   Problem 99 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1991.
#   
#   classification PPR-AN-6-4
#

export hs99

"HS99 model"
function hs99(args...; kwargs...)

  b = 32
  a = [0, 50, 50, 75, 75, 75, 100, 100]
  t = [0, 25, 50, 100, 150, 200, 290, 380]

  nlp = Model()

  @variable(nlp, 0 ≤ x[i = 1:7] ≤ 1.58, start = 0.5)

  @NLconstraint(nlp, sum(0.5 * (t[i] - t[i - 1])^2 * (a[i] * sin(x[i - 1]) - b) + (t[i] - t[i - 1]) * sum((t[j] - t[j - 1]) * (a[j] * sin(x[j - 1]) - b) for j=2:(i- 1)) for i=2:8) - 1e5 == 0)
  @NLconstraint(nlp, sum( (t[i] - t[i - 1]) * (a[i] * sin(x[i - 1]) - b)  for i=2:8) - 1e3 == 0)

  @NLobjective(nlp, Min, -(sum(a[i] * (t[i] - t[i - 1]) * cos(x[i - 1]) for i=2:8))^2)

  return nlp
end
