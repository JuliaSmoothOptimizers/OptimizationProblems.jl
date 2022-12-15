# Hock and Schittkowski problem number 69.
#
#   Source:
#   Problem 69 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GGR-P1-2
#
# Original source:
# E. von Collani, Kostenoptimale Prufplane bei laufender
# Kontrolle eines normalverteilten Merkmals, Dissertation,
# Institut fur Angewandte Mathematik und Statistik, Universitat Wurzburg, 1978. 

export hs69

function hs69(args...; kwargs...)
  a1 = 1 // 10
  b1 = 1000
  d1 = 1
  n1 = 4

  nlp = Model()
  x0 = [1, 1, 1, 1]
  lvar = [1 // 10000, 0, 0, 0]
  uvar = [100, 100, 2, 2]
  @variable(nlp, lvar[i] ≤ x[i = 1:4] ≤ uvar[i], start = x0[i])

  phi(t) = 1 // 2 * (erf(t / sqrt(2)) + 1)
  register(nlp, :phi, 1, phi; autodiff = true)
  @NLconstraint(nlp, x[3] - 2 * phi(x[2]) == 0)
  @NLconstraint(nlp, x[4] - phi(-x[2] + d1 * sqrt(n1)) - phi(-x[2] - d1 * sqrt(n1)) == 0)

  @NLobjective(nlp, Min, (a1 * n1 - (b1 * (exp(x[1] - 1) - x[3])) / (exp(x[1] -1 + x[4])) * x[4]) / x[1])

  return nlp
end
