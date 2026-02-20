## Banded trigonometric problem
#
#   Problem 16 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
#
export trigb

function trigb(args...; n::Int = default_nvar, kwargs...)
  model = Model()
  @variable(model, x[i = 1:n], start = 1)

  @objective(
    model,
    Min,
    sum(
      i *
      ((1 - cos(x[i])) + ((i == 1) ? sin(0) : sin(x[i - 1])) - ((i == n) ? 0 : sin(x[i + 1])))
      for i = 1:n
    )
  )

  return model
end
