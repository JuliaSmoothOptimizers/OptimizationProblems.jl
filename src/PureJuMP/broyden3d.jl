export broyden3d

function broyden3d(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = -1.0)

  @objective(
    nlp,
    Min,
    0.5 * sum(((3 - 2 * x[i]) * x[i] - x[i - 1] - 2 * x[i + 1] + 1)^2 for i = 2:(n - 1)) +
    0.5 * ((3 - 2 * x[1]) * x[1] - 2 * x[2] + 1)^2 +
    0.5 * ((3 - 2 * x[n]) * x[n] - x[n - 1] + 1)^2
  )

  return nlp
end
