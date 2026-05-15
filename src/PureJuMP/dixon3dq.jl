export dixon3dq

"Dixon's tridiagonal quadratic."
function dixon3dq(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = -1.0)

  @objective(
    nlp,
    Min,
    0.5 * (x[1] - 1.0)^2 + 0.5 * (x[n] - 1.0)^2 + 0.5 * sum((x[i] - x[i + 1])^2 for i = 2:(n - 1))
  )

  return nlp
end
