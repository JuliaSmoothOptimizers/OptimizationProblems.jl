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

# Evaluate the Chebyshev polynomial T_i(x) via the three-term recurrence.
# Returns a scalar — no allocations.
function _cheby_recurrence(xj, i::Integer)
  i == 0 && return one(xj)
  i == 1 && return xj
  tk_prev = one(xj)
  tk = xj
  for _ = 2:i
    tk_next = 2 * xj * tk - tk_prev
    tk_prev = tk
    tk = tk_next
  end
  return tk
end

function chebyquad(args...; n::Int = default_nvar, m::Int = n, kwargs...)
  m = max(m, n)
  nlp = Model()
  x0 = Vector{Float64}(undef, n)
  for j = 1:n
    x0[j] = j / (n + 1)
  end
  @variable(nlp, x[j = 1:n], start = x0[j])

  # Odd-degree residuals: r_{2i-1} = (1/n) * sum_j T_{2i-1}(x[j])
  # Even-degree residuals: r_{2i}   = (1/n) * sum_j T_{2i}(x[j])  + 1/((2i)^2 - 1)
  @objective(
    nlp,
    Min,
    0.5 * sum(
      ((1 / n) * sum(_cheby_recurrence(x[j], 2i - 1) for j = 1:n))^2 for
      i = 1:div(m + 1, 2)
    ) + 0.5 * sum(
      ((1 / n) * sum(_cheby_recurrence(x[j], 2i) for j = 1:n) + 1 / ((2i)^2 - 1))^2 for
      i = 1:div(m, 2)
    ),
  )
  return nlp
end
