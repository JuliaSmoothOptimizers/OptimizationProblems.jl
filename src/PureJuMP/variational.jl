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
  model = Model()
  x0 = Vector{Float64}(undef, n)
  for i = 1:n
    x0[i] = i * h * (1.0 - i * h)
  end
  @variable(model, x[i = 1:n], start = x0[i])

  if n == 1
    @objective(
      model,
      Min,
      2 * (
        x[1] * (x[1] - 0.0) / h +
        n *
        (h / 2) *
        (
          exp(0) * (1 + (x[1] - 0)/2 + (x[1] - 0)^2/6 + (x[1] - 0)^3/24 + (x[1] - 0)^4/120) +
          exp(x[1]) * (1 + (0 - x[1])/2 + (0 - x[1])^2/6 + (0 - x[1])^3/24 + (0 - x[1])^4/120)
        )
      )
    )
  else
    @objective(
      model,
      Min,
      2 * (
        (sum(x[i] * (x[i] - x[i + 1]) / h for i = 1:(n - 1)) + x[n] * (x[n] - 0) / h) +
        n *
        (h / 2) *
        (
          exp(x[1]) * (1 + (x[1] - 0) / 2 + (x[1] - 0)^2 / 6 + (x[1] - 0)^3 / 24 + (x[1] - 0)^4 / 120) +
          sum(exp(x[j]) * (1 + (x[j + 1] - x[j]) / 2 + (x[j + 1] - x[j])^2 / 6 + (x[j + 1] - x[j])^3 / 24 + (x[j + 1] - x[j])^4 / 120) for j = 1:(n - 1)) +
          exp(0) * (1 + (0 - x[n]) / 2 + (0 - x[n])^2 / 6 + (0 - x[n])^3 / 24 + (0 - x[n])^4 / 120)
        )
      )
    )
  end

  return model
end
