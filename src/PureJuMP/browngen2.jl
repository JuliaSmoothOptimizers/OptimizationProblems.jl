# Generalization of the Brown function 2
#
#   Problem 13 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
export browngen2

function browngen2(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n])
  for i in 1:n
    set_start_value(x[i], isodd(i) ? -1.0 : 1.0)
  end

  @objective(nlp, Min,
    sum((x[i-1]^2)^(x[i]^2 + 1) + (x[i]^2)^(x[i-1]^2 + 1) for i = 2:n)
  )
  return nlp
end
