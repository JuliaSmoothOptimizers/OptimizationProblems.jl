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

"""
variational_registered(; n::Int = default_nvar, kwargs...)

Build the variational JuMP model but register the package-level `diffquot`
function and call it from NL expressions. This is useful to test the
registered-function path (autodiff through the registered function).
"""
function variational_registered(; n::Int = default_nvar, kwargs...)
  h = 1 // (n + 1)
  model = Model()
  x0 = Vector{Float64}(undef, n)
  for i = 1:n
    x0[i] = i * h * (1 - i * h)
  end
  @variable(model, x[i = 1:n], start = x0[i])

  if n == 1
    @expression(model, term1, x[1] * (x[1] - 0) / h)
  else
    @expression(model, term1_mid, sum(x[i] * (x[i] - x[i+1]) / h for i = 1:n-1))
    @expression(model, term1, term1_mid + x[n] * (x[n] - 0) / h)
  end

  JuMP.register(model, :diffquot, 2, Main.OptimizationProblems.diffquot; autodiff = true)

  if n == 1
    @NLexpression(model, term2, diffquot(x[1], 0) + diffquot(0, x[1]))
  else
    @NLexpression(model, term2_mid, sum(diffquot(x[j+1], x[j]) for j = 1:n-1))
    @NLexpression(model, term2, diffquot(x[1], 0) + term2_mid + diffquot(0, x[n]))
  end
  @NLobjective(model, Min, 2 * (term1 + n * (h / 2) * term2))
  return model
end

function variational(; n::Int = default_nvar, kwargs...)
  h = 1 // (n + 1)
  model = Model()
  x0 = Vector{Float64}(undef, n)
  for i = 1:n
    x0[i] = i * h * (1.0 - i * h)
  end
  @variable(model, x[i = 1:n], start = x0[i])

  if n == 1
    @expression(model, term1, x[1] * (x[1] - 0.0) / h)
  else
    @expression(model, term1_mid, sum(x[i] * (x[i] - x[i+1]) / h for i = 1:n-1))
    @expression(model, term1, term1_mid + x[n] * (x[n] - 0) / h)
  end
  if n == 1
    @expression(model, term2,
      exp(x[1]) * (1 + (0 - x[1])/2 + (0 - x[1])^2/6 + (0 - x[1])^3/24 + (0 - x[1])^4/120)
      + exp(0) * (1 + (x[1] - 0)/2 + (x[1] - 0)^2/6 + (x[1] - 0)^3/24 + (x[1] - 0)^4/120)
    )
  else
    @expression(model, term2_mid,
      sum(exp(x[j+1]) * (1 + (x[j] - x[j+1]) / 2 + (x[j] - x[j+1])^2 / 6 + (x[j] - x[j+1])^3 / 24 + (x[j] - x[j+1])^4 / 120) for j = 1:n-1)
    )
    @expression(model, term2,
      exp(x[1]) * (1 + (0 - x[1]) / 2 + (0 - x[1])^2 / 6 + (0 - x[1])^3 / 24 + (0 - x[1])^4 / 120)
      + term2_mid
      + exp(0) * (1 + (x[n] - 0) / 2 + (x[n] - 0)^2 / 6 + (x[n] - 0)^3 / 24 + (x[n] - 0)^4 / 120)
    )
  end
  @objective(model, Min, 2 * (term1 + n * (h / 2) * term2))
  return model
end
