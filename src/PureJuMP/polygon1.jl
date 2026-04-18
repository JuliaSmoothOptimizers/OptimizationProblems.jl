export polygon1

function polygon1(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()
  N = div(n, 2)
  @variable(nlp, 0 <= r[1:N] <= 1)
  @variable(nlp, 0 <= θ[1:N] <= 2π)

  # impose an order to the angles
  @constraint(nlp, θ[1] == 0)
  for i = 1:(N - 1)
    @constraint(nlp, θ[i + 1] - θ[i] >= 0.0)
  end

  @objective(
    nlp,
    Min,
    -0.5 * sum(r[i] * r[i + 1] * sin(θ[i + 1] - θ[i]) for i = 1:(N - 1)) -
    0.5 * r[1] * r[N] * sin(θ[1] - θ[N])
  )
  return nlp
end
