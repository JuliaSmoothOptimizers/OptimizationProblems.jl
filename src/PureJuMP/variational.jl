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
  h = 1 // (n + 1)
  model = Model()
  # type-stable start matching ADNLPProblems
  x0 = [i * h * (1 - i * h) for i = 1:n]
  @variable(model, x[i = 1:n], start = x0[i])

  # term1: interior sum plus last boundary term (avoid ternary inside macro)
  if n == 1
    @expression(model, term1, x[1] * (x[1] - 0.0) / h)
  else
    @expression(model, term1_mid, sum(x[i] * (x[i] - x[i+1]) / h for i = 1:n-1))
    @expression(model, term1, term1_mid + x[n] * (x[n] - 0.0) / h)
  end

  diffquot(a, b) = (b - a == zero(b - a)) ? exp(a) : (exp(b) - exp(a)) / (b - a)
  JuMP.register(model, :diffquot, 2, diffquot; autodiff = true)

  if n == 1
    @expression(model, term2, diffquot(x[1], 0.0) + diffquot(0.0, x[1]))
  else
    @expression(model, term2_mid, sum(diffquot(x[j+1], x[j]) for j = 1:n-1))
    @expression(model, term2, diffquot(x[1], 0.0) + term2_mid + diffquot(0.0, x[n]))
  end
  @objective(model, Min, 2 * (term1 + n * (h / 2) * term2))
  return model
end
