# Example 5.3, Dominique Orban, Computation Optimization and Control lecture notes at Polytechnique Montréal.
# This is a simple investment problem in optimistic market.

export controlinvestment

function controlinvestment(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  N = div(n, 2)
  h = 1 / N
  x0 = 1.0
  gamma = 3

  @variable(nlp, x[1:N], start = x0)
  @variable(nlp, 0 ≤ u[1:N] ≤ 1, start = 0)

  @NLexpression(nlp, f[k = 1:N], (u[k] - 1) * x[k])
  @objective(nlp, Min, 0.5 * h * sum(f[k] + f[k + 1] for k = 1:(N - 1)))

  @constraint(nlp, x[1] == x0)
  @constraint(
    nlp,
    dx[k = 1:(N - 1)],
    x[k + 1] - x[k] - 0.5 * h * gamma * (u[k] * x[k] + u[k + 1] * x[k + 1]) == 0.0
  )

  return nlp
end
