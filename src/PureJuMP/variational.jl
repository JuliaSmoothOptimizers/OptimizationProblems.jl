# Discretization of a variational problem
#
#   Problem 15 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
export variational

function variational(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = one(T) / T(n + 1)
  model = Model()
  # type-stable start matching ADNLPProblems
  x0 = [T(i) * h * (one(T) - T(i) * h) for i = 1:n]
  @variable(model, x[i = 1:n], start = x0[i])

  # term1: interior sum plus last boundary term (avoid ternary inside macro)
  if n == 1
    @expression(model, term1, x[1] * (x[1] - 0.0) / $(h))
  else
    @expression(model, term1_mid, sum(x[i] * (x[i] - x[i+1]) / $(h) for i = 1:n-1))
    @expression(model, term1, term1_mid + x[n] * (x[n] - 0.0) / $(h))
  end

  # term2: build the boundary terms and interior sum separately to avoid
  # invalid indexing in the NL macro (handle n==1 specially)
  if n == 1
    @expression(model, term2, (exp(x[1]) - exp(0.0)) / (x[1] - 0.0) + (exp(0.0) - exp(x[1])) / (0.0 - x[1]))
  else
    @expression(model, term2_mid, sum((exp(x[j+1]) - exp(x[j])) / (x[j+1] - x[j]) for j = 1:n-1))
    @expression(model, term2, (exp(x[1]) - exp(0.0)) / (x[1] - 0.0) + term2_mid + (exp(0.0) - exp(x[n])) / (0.0 - x[n]))
  end

  @objective(model, Min, $(T(2)) * (term1 + $(T(n)) * ($(h) / $(T(2))) * term2))
  return model
end
