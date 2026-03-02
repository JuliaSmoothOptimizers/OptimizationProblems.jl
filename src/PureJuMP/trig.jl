# Another trigonometric function
#
#   Problem 9 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
#
export trig

function trig(args...; n::Int = default_nvar, kwargs...)
  model = Model()
  @variable(model, x[i = 1:n], start = 1 / n)

  @objective(
    model,
    Min,
    (1 / n) * sum(
      i * (1 - cos(x[i])) + (
        begin
          jmin = max(1, i - 2)
          jmax = min(n, i + 2)
          s = zero(Float64)
          for j = jmin:jmax
            aij = 5 * (1 + mod(i, 5) + mod(j, 5))
            bij = (i + j) / 10
            s += aij * sin(x[j]) + bij * cos(x[j])
          end
          if iseven(n)
            half = n ÷ 2
            j1 = i + half
            if 1 <= j1 <= n && (j1 < jmin || j1 > jmax)
              aij = 5 * (1 + mod(i, 5) + mod(j1, 5))
              bij = (i + j1) / 10
              s += aij * sin(x[j1]) + bij * cos(x[j1])
            end
            j2 = i - half
            if 1 <= j2 <= n && j2 != j1 && (j2 < jmin || j2 > jmax)
              aij = 5 * (1 + mod(i, 5) + mod(j2, 5))
              bij = (i + j2) / 10
              s += aij * sin(x[j2]) + bij * cos(x[j2])
            end
          end
          s
        end
      ) for i = 1:n
    )
  )

  return model
end
