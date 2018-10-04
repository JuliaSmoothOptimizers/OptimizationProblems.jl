#   Meyer function
#
#   Source:  Problem 10 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#
#   See also Buckley #29 (p. 73).
#
#   classification SUR2-RN-3-0

export meyer3

"Meyer function"
function meyer3(args...)

  nlp = Model()

  x0 = [0.02, 4000, 250]

  @variable(nlp, x[j=1:3], start=x0[j])

  y = [34780, 28610, 23650, 19630, 16370, 13720, 11540, 9744, 8261, 7030, 6005,
  5147, 4427, 3820, 3307, 2872]

  t = 45 .+ 5 * (1:16)

  @NLobjective(
    nlp,
    Min,
    sum((x[1] * exp(x[2]/(t[i] + x[3])) - y[i])^2 for i = 1:16)
  )

  return nlp

end
