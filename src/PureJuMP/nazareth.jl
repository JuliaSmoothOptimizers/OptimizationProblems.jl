# Sparse modification of the Nazareth trigonometric function
#
#   Problem 8 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
export nazareth

function nazareth(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n], start = 1 / n)

  A = zeros(Float64, n, n)
  B = zeros(Float64, n, n)
  neighbors = [Int[] for _ in 1:n]
  nh = div(n, 2)
  for i in 1:n
    lo = max(1, i - 2)
    hi = min(n, i + 2)
    for j in lo:hi
      if A[i, j] == 0.0
        push!(neighbors[i], j)
      end
      A[i, j] = 5.0 * (1 + mod(i, 5) + mod(j, 5))
      B[i, j] = (i + j) / 10
    end
    for j in (i - nh, i + nh)
      if 1 <= j <= n && (j < lo || j > hi)
        if A[i, j] == 0.0
          push!(neighbors[i], j)
        end
        A[i, j] = 5.0 * (1 + mod(i, 5) + mod(j, 5))
        B[i, j] = (i + j) / 10
      end
    end
  end

  @objective(nlp, Min,
    sum(
      (n + i - sum(A[i, j] * sin(x[j]) + B[i, j] * cos(x[j]) for j in neighbors[i]))^2
      for i = 1:n
    ) / n
  )
  return nlp
end
