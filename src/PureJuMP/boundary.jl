# Discrete boundary value problem
#
#   Problem 14 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
export boundary

function boundary(; n::Int = default_nvar, kwargs...)
  h = 1 // n + 1
  model = Model()
  x0 = [i * h * (1 - i * h) for i = 1:n]
  @variable(model, x[i = 1:n], start = x0[i])
  @objective(
    model,
    Min,
    sum(
      (
        2 * x[i] - (i == 1 ? 0 : x[i - 1]) - (i == n ? 0 : x[i + 1]) +
        (h^2 / 2) * (x[i] + Float64(i) * h + 1)^3
      )^2 for i = 1:n
    )
  )
  return model
end
