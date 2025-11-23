# Toint trigonometric function
#
#   Problem 10 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
#
export toint

function toint(args...; n::Int = default_nvar, kwargs...)
  model = Model()
  @variable(model, x[i = 1:n], start = 1)

  @objective(
    model,
    Min,
    (1 / n) * sum(begin
      ci = 1 + i / 10
      s = zero(Float64)
      js = max(1, i - 2):min(n, i + 2)
      if iseven(n)
        js = sort(collect(union(collect(js), [j for j in (i + n ÷ 2, i - n ÷ 2) if 1 <= j <= n])))
      end
      for j in js
        aij = 5 * (1 + mod(i, 5) + mod(j, 5))
        bij = (i + j) / 10
        cj = 1 + j / 10
        s += aij * sin(bij + ci * x[i] + cj * x[j])
      end
      s
    end for i = 1:n)
  )

  return model
end
