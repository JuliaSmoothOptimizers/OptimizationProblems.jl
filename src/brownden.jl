#   Brown and Dennis function
#
#   Source: Problem 16 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#
#   See also Buckley#30
#
#   classification SUR2-AN-4-0

export brownden

"Brown and Dennis function"
function brownden(m::Int=20)

  m < 4 && Compat.@warn("brownden: must have m ≥ 4")
  m = max(m, 4)

  nlp = Model()

  x0 = [25.0, 5, -5, -1]

  @variable(nlp, x[j=1:4], start=x0[j])

  t = Float64[i/5 for i = 1:m]

  @NLobjective(
    nlp,
    Min,
    sum(((x[1] + t[i] * x[2] - exp(t[i]))^2 + (x[3] + x[4] * sin(t[i]) - cos(t[i]))^2)^2 for i = 1:m)
  )

  return nlp
end
