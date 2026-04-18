export sbrybnd

"Broyden banded system of nonlinear equations in size 'n' "
function sbrybnd(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("sbrybnd: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()
  p = zeros(n)
  J = Array{Any}(undef, n)
  for i = 1:n
    p[i] = exp(6.0 * (i - 1) / (n - 1))
    J[i] = [max(1, i - 5):(i - 1); (i + 1):min(n, i + 1)]
  end

  @variable(nlp, x[i = 1:n], start = 1.0 / p[i])

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (
        (2.0 + 5.0 * p[i]^2 * x[i]^2) * p[i] * x[i] + 1.0 -
        sum(p[j] * x[j] * (1.0 + p[j] * x[j]) for j in J[i])
      )^2 for i = 1:n
    )
  )

  return nlp
end
