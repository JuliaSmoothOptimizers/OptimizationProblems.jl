export integreq

"Linear function with `n` parameters and `m` observations  - full rank"
function integreq(args...; n::Int = default_nvar, kwargs...)
  h = 1 / (n + 1)

  nlp = Model()

  @variable(nlp, x[j = 1:n], start = 1.0)
  x0 = [j * h * (j * h - 1) for j = 1:n]
  set_start_value.(x, x0)

  @objective(
    nlp,
    Min,
    1 / 2 * sum(
      (
        x[i] +
        h * (
          (1 - i * h) * sum(j * h * (x[j] + j * h + 1)^3 for j = 1:i) +
          i * h * sum((1 - j * h) * (x[j] + j * h + 1)^3 for j = (i + 1):n)
        ) / 2
      )^2 for i = 1:(n - 1)
    ) + 1 / 2 * (x[n] + h * ((1 - n * h) * sum(j * h * (x[j] + j * h + 1)^3 for j = 1:n)) / 2)^2
  )

  return nlp
end
