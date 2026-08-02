export ackley

"Ackley multimodal minimization problem"
function ackley(args...; n::Int = default_nvar, kwargs...)
  n < 1 && @warn("ackley: number of variables must be ≥ 1")
  n = max(1, n)

  nlp = Model()

  x0 = zeros(n)
  @variable(nlp, -32.768 <= x[i = 1:n] <= 32.768, start = x0[i])

  @objective(
    nlp,
    Min,
    -20 * exp(-0.2 * sqrt(sum(x[i]^2 for i = 1:n) / n)) -
    exp(sum(cos(2 * π * x[i]) for i = 1:n) / n) +
    20 +
    exp(1)
  )

  return nlp
end
