export morebv

function morebv(args...; n::Int = default_nvar, kwargs...)

  # indices in Luksan go from 0 to n+1
  n < 2 && @warn("morebv: number of variables must be ≥ 4")
  n = max(2, n)

  h = 1.0 / (n + 1)

  x0 = 0.5 * ones(n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = x0[i])   # AMPL starts at i*h*(i*h - 1), ref https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/morebv.mod

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (2.0 * x[i] - x[i - 1] - x[i + 1] + (h^2 / 2.0) * (x[i] + i * h + 1)^3)^2 for i = 2:(n - 1)
    ) +
    0.5 * (2.0 * x[1] - x[2] + (h^2 / 2.0) * (x[1] + 1)^3)^2 +
    0.5 * (2.0 * x[n] - x[n - 1] + (h^2 / 2.0) * (x[n] + n * h + 1)^3)^2
  )

  return nlp
end
