# Generalization of the Brown function 1
#
#   Problem 12 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
export browngen1

function browngen1(; n::Int = default_nvar)
  nlp = Model()
  n = max(2, n)
  @variable(nlp, x[1:n])
  for i = 1:n
    set_start_value(x[i], isodd(i) ? 0.0 : -1.0)
  end

  @objective(
    nlp,
    Min,
    sum((x[i - 1] - 3)^2 + (x[i - 1] - x[i])^2 + exp(20 * (x[i - 1] - x[i])) for i = 2:n)
  )
  return nlp
end
