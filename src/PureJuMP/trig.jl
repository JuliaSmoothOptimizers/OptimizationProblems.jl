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
      i * (1 - cos(x[i])) +
      (
        sum(5 * (1 + mod(i, 5) + mod(j, 5)) * sin(x[j]) + (i + j) / 10 * cos(x[j]) for j in (
          iseven(n) ? sort(collect(union(collect(max(1, i - 2):min(n, i + 2)), [j for j in (i + n ÷ 2, i - n ÷ 2) if 1 <= j <= n]))) : max(1, i - 2):min(n, i + 2)
        ))
      ) for i = 1:n
    )
  )

  return model
end
