#   Dixon's tridiagonal quadratic.
#
#   Source: problem 156 (p. 51) in
#   A.R. Buckley,
#   "Test functions for unconstrained minimization",
#   TR 1989CS-3, Mathematics, statistics and computing centre,
#   Dalhousie University, Halifax (CDN), 1989.
#
#   classification QUR2-AN-V-0

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
