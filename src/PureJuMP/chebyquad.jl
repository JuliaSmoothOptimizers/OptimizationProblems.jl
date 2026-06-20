#
#   The Chebyshev quadrature problem in variable dimension, using the
#   exact formula for the shifted Chebyshev polynomials.  This is a
#   nonlinear least-squares problem with n groups. The Hessian is full.
#
#   Source: Problem 35 in
#      J.J. More', B.S. Garbow and K.E. Hillstrom,
#      "Testing Unconstrained Optimization Software",
#      ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#   Also problem 58 in 
#      A.R. Buckley,
#      "Test functions for unconstrained minimization",
#      TR 1989CS-3, Mathematics, statistics and computing centre,
#      Dalhousie University, Halifax (CDN), 1989.
#
#   classification SBR2-AN-V-0
export chebyquad

function _cheby_recurrence(xj, i)
  # allow non-integer numeric i (JuMP may pass floats); coerce to integer
  ii = Int(round(i))
  ii == 0 && return one(xj)
  ii == 1 && return xj
  tk_minus_1 = one(xj)
  tk = xj
  for _ = 2:ii
    tk_plus_1 = 2 * xj * tk - tk_minus_1
    tk_minus_1 = tk
    tk = tk_plus_1
  end
  return tk
end

function chebyquad(args...; n::Int = default_nvar, m::Int = n, kwargs...)
  m = max(m, n)
  nlp = Model()
  x0 = [j / (n + 1) for j = 1:n]
  @variable(nlp, x[j = 1:n], start = x0[j])

  try
    JuMP.register(nlp, :cheby, 2, _cheby_recurrence; autodiff = true)
  catch
    # In case register signature or availability differs, fall back silently.
  end

  @NLobjective(
    nlp,
    Min,
    0.5 * sum(
      (1 / n * sum(cheby(x[j], 2i) for j = 1:n) + 1 / ((2i)^2 - 1))^2 for i = 1:div(m, 2)
    ) + 0.5 * sum(
      (1 / n * sum(cheby(x[j], 2i - 1) for j = 1:n))^2 for i = 1:div(m + 1, 2)
    ),
  )
  return nlp
end
