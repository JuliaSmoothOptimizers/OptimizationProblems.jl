export brownal

"Brownbs Model"
function brownal(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 1 / 2)

  @objective(
    nlp,
    Min,
    0.5 * sum((x[i] + sum(x[j] for j = 1:n) - (n + 1))^2 for i = 1:(n - 1)) +
    0.5 * (prod(x[j] for j = 1:n) - 1)^2
  )

  return nlp
end
