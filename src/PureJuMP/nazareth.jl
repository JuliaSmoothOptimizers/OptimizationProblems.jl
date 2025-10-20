export nazareth

function nazareth(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n], start = 1.0 / n)

  A = zeros(Float64, n, n)
  B = zeros(Float64, n, n)
  nh = div(n, 2)
  for i in 1:n
    lo = max(1, i - 2)
    hi = min(n, i + 2)
    # Local band: include all j in lo:hi (including j == i)
    for j in lo:hi
      A[i, j] = 5.0 * (1 + mod(i, 5) + mod(j, 5))
      B[i, j] = (i + j) / 10
    end
    # Long-range neighbors |j - i| == n/2, only if not already included
    for j in (i - nh, i + nh)
      if 1 <= j <= n && (j < lo || j > hi)
        A[i, j] = 5.0 * (1 + mod(i, 5) + mod(j, 5))
        B[i, j] = (i + j) / 10
      end
    end
  end

  @NLobjective(nlp, Min,
    sum(
      (n + i - sum(A[i, j] * sin(x[j]) + B[i, j] * cos(x[j]) for j = 1:n))^2
      for i = 1:n
    )
  )
  return nlp
end
