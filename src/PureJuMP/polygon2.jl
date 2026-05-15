export polygon2

function polygon2(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()
  N = div(n, 2)
  @variable(nlp, 0 <= r[1:N] <= 1)
  @variable(nlp, α[1:N] >= 0)

  # impose an order to the angles
  @constraint(nlp, sum(α) == 2π)

  @objective(
    nlp,
    Min,
    -0.5 * sum(r[i] * r[i + 1] * sin(α[i]) for i = 1:(N - 1)) - 0.5 * r[1] * r[N] * sin(α[N])
  )
  return nlp
end
