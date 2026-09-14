export chebyquad

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

"The Chebyshev quadrature problem in variable dimension"
function chebyquad(args...; n::Int = default_nvar, m::Int = n, kwargs...)
  m = max(m, n)
  nlp = Model()
  @variable(nlp, x[j = 1:n], start = j / (n + 1))
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
