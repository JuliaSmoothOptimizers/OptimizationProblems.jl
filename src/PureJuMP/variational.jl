# Discretization of a variational problem
#
#   Problem 15 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
export variational

function variational(; n::Int = default_nvar, kwargs...)
  h = 1 // (n + 1)
  x0 = [i * h * (1.0 - i * h) for i = 1:n]
  model = Model()
  @variable(model, x[i = 1:n], start = x0[i])

  @objective(
    model,
    Min,
    2 * (
      (sum(x[i] * (x[i] - x[i + 1]) / h for i = 1:(n - 1)) + x[n] * x[n] / h) +
      n *
      (h / 2) *
      (
        (1 + x[1]/2 + x[1]^2/6 + x[1]^3/24 + x[1]^4/120) +
        sum(exp(x[j]) * (1 + (x[j + 1] - x[j]) / 2 + (x[j + 1] - x[j])^2 / 6 + (x[j + 1] - x[j])^3 / 24 + (x[j + 1] - x[j])^4 / 120) for j = 1:(n - 1)) +
        exp(x[n]) * (1 + (0 - x[n]) / 2 + (0 - x[n])^2 / 6 + (0 - x[n])^3 / 24 + (0 - x[n])^4 / 120)
      )
    )
  )

  return model
end
