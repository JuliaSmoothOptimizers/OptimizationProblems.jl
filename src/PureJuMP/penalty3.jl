export penalty3

"A penalty problem by Gill, Murray and Pitfield in size 'n' "
function penalty3(args...; n::Int = default_nvar, kwargs...)
  n < 3 && @warn("penalty3: number of variables must be ≥ 3")
  n = max(3, n)

  nlp = Model()
  @variable(nlp, x[i = 1:n], start = i / (n + 1))

  @objective(
    nlp,
    Min,
    1.0 +
    sum((x[i] - 1.0)^2 for i = 1:div(n, 2)) +
    exp(x[n]) * sum((x[i] + 2.0 * x[i + 1] + 10.0 * x[i + 2] - 1.0)^2 for i = 1:(n - 2)) +
    sum((x[i] + 2.0 * x[i + 1] + 10.0 * x[i + 2] - 1.0)^2 for i = 1:(n - 2)) *
    sum((2.0 * x[i] + x[i + 1] - 3.0)^2 for i = 1:(n - 2)) +
    exp(x[n - 1]) * sum((2.0 * x[i] + x[i + 1] - 3.0)^2 for i = 1:(n - 2)) +
    (sum(x[i]^2 - n for i = 1:n))^2
  )

  return nlp
end
