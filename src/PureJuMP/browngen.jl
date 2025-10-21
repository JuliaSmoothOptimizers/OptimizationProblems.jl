# Generalization of the Brown function
#
# Source:
#   L. Luksan, C. Matonoha, J. Vlček,
#   "Sparse Test Problems for Unconstrained Optimization".
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
#
# Test set:
#   - Type: OP (OptimizationProblems.jl)
#   - Problem 12: Generalization of the Brown function 1
#
# Definition:
#   F(x) = ∑_{i=2}^n [ (x_{i-1} - 3)^2 + (x_{i-1} - x_i)^2 + exp(20 (x_{i-1} - x_i)) ].
#
# Initialization:
#   x_i = 0 for odd i, and x_i = -1 for even i.
export browngen

function browngen(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n])
  for i in 1:n
    set_start_value(x[i], isodd(i) ? 0.0 : -1.0)
  end

  @objective(nlp, Min,
    sum((x[i-1] - 3)^2 + (x[i-1] - x[i])^2 + exp(20 * (x[i-1] - x[i])) for i = 2:n)
  )
  return nlp
end
