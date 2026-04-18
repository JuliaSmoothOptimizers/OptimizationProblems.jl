export genrose, rosenbrock

"Generalized Rosenbrock model in size `n`"
function genrose(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("genrose: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  x0 = [(i / (n + 1)) for i = 1:n]
  # Alternative:
  # x0 .= -1.2
  # for i=1:Int(round(n / 2))
  #   x0 = 1
  # end
  @variable(nlp, x[i = 1:n], start = x0[i])

  @objective(
    nlp,
    Min,
    1.0 +
    100 * sum((x[i + 1] - x[i]^2)^2 for i = 1:(n - 1)) +
    sum((x[i] - 1.0)^2 for i = 1:(n - 1))
  )

  return nlp
end

"Classic Rosenbrock problem"
rosenbrock(args...; kwargs...) = genrose(n = 2)
