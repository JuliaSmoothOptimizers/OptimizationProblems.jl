export boundary

function boundary(; n::Int = default_nvar, kwargs...)
  h = 1 // (n + 1)
  model = Model()
  x0 = [i * h * (1 - i * h) for i = 1:n]
  @variable(model, x[i = 1:n], start = x0[i])
  @objective(
    model,
    Min,
    sum(
      (
        2 * x[i] - (i == 1 ? 0 : x[i - 1]) - (i == n ? 0 : x[i + 1]) +
        (h^2 / 2) * (x[i] + i * h + 1)^3
      )^2 for i = 1:n
    )
  )
  return model
end
