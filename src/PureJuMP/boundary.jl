# Discrete boundary value problem
#
#   Problem 14 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
export boundary

function boundary(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = one(T) / T(n + 1)
  model = Model()
  # set a type-stable start vector matching ADNLPProblems.boundary x0
  x0 = [T(i) * h * (one(T) - T(i) * h) for i = 1:n]
  @variable(model, x[i = 1:n], start = x0[i])
  @objective(model, Min,
    sum((T(2) * x[i] - (i == 1 ? zero(x[1]) : x[i-1]) - (i == n ? zero(x[1]) : x[i+1])
      + (h^2 / T(2)) * (x[i] + T(i) * h + one(T))^3)^2 for i = 1:n))
  return model
end
