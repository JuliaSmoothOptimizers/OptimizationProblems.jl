export watson

function watson(args...; n::Int = default_nvar, kwargs...)
  n = min(max(n, 2), 31)
  m = 31

  nlp = Model()

  @variable(nlp, x[j = 1:n], start = 0.0)

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (
        sum((j - 1) * x[j] * (i / 29)^(j - 2) for j = 2:n) -
        sum(x[j] * (i / 29)^(j - 1) for j = 1:n)^2 - 1
      )^2 for i = 1:29
    ) +
    0.5 *
    (
      sum((j - 1) * x[j] * x[1]^(j - 2) for j = 2:n) - sum(x[j] * x[1]^(j - 1) for j = 1:n)^2 - 1
    )^2 +
    0.5 *
    (
      sum((j - 1) * x[j] * (x[2] - x[1]^2 - 1)^(j - 2) for j = 2:n) -
      sum(x[j] * (x[2] - x[1]^2 - 1)^(j - 1) for j = 1:n)^2 - 1
    )^2
  )

  return nlp
end
