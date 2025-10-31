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
  nh = div(n, 2)

  nlp = Model()
  @variable(nlp, x[1:n], start = 1 / n)

  @objective(nlp, Min, sum((
    begin
      lo = max(1, i - 2)
      hi = min(n, i + 2)

      sumtrig = 0
      for j = lo:hi
        aij = 5 * (1 + mod(i, 5) + mod(j, 5))
        bij = (i + j) / 10
        sumtrig += aij * sin(x[j]) + bij * cos(x[j])
      end

      j1 = i - nh
      j2 = i + nh
      for j in (j1, j2)
        if 1 <= j <= n && (j < lo || j > hi)
          aij = 5 * (1 + mod(i, 5) + mod(j, 5))
          bij = (i + j) / 10
          sumtrig += aij * sin(x[j]) + bij * cos(x[j])
        end
      end

      (n + i - sumtrig)^2
    end
  ) for i = 1:n) / n)
  return nlp
end
