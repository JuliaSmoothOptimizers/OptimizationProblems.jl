#   The discrete integral problem.
#
#   Source: problem 29 in
#      J.J. More, B.S. Garbow and K.E. Hillstrom,
#      "Testing Unconstrained Optimization Software",
#      ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#   Also problem 165 (p. 74) in
#      A.R. Buckley,
#      "Test functions for unconstrained minimization",
#      TR 1989CS-3, Mathematics, statistics and computing centre,
#      Dalhousie University, Halifax (CDN), 1989.
#
#   classification NOR2-AN-V-V

export integreq

"Linear function with `n` parameters and `m` observations  - full rank"
function integreq(args...; n::Int = default_nvar, kwargs...)
  h = 1 / (n + 1)

  nlp = Model()

  @variable(nlp, x[j = 1:n], start = 1.0)
  x0 = [j * h * (j * h - 1) for j=1:n]
  set_start_value.(x, x0)

  @NLobjective(
    nlp,
    Min,
    1 / 2 * sum((x[i] + h * ((1 - i * h) * sum(j * h * (x[j] + j * h + 1)^3 for j=1:i) + i * h * sum((1 - j * h) * (x[j] + j * h + 1)^3 for j=(i + 1):n)) / 2)^2 for i = 1:(n-1)) + 1 / 2 * (x[n] + h * ((1 - n * h) * sum(j * h * (x[j] + j * h + 1)^3 for j=1:n)) / 2)^2
  )

  return nlp
end
