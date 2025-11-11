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
  x0 = [convert(T, (i * h) * (1 - i * h)) for i = 1:n]
  model = Model()
  @variable(model, x[i = 1:n], start = x0[i])

  @objective(
    model,
    Min,
    2 * (
      (sum(x[i] * (x[i] - x[i + 1]) / h for i ∈ 1:(n - 1)) + x[n] * x[n] / h) +
      n *
      (h / 2) *
      (
        (exp(x[1]) - exp(0)) / (x[1] - 0) +
        sum((exp(x[j + 1]) - exp(x[j])) / (x[j + 1] - x[j]) for j ∈ 1:(n - 1)) +
        (exp(0) - exp(x[n])) / (0 - x[n])
      )
    )
  )

  return model
end
