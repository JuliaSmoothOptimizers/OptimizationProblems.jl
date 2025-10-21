# Augmented Lagrangian function
#
# Source:
#   L. Luksan, C. Matonoha, J. Vlček,
#   "Sparse Test Problems for Unconstrained Optimization".
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
#
# Test set:
#   - Type: OP (OptimizationProblems.jl)
#   - Part of the Luksan–Matonoha–Vlček sparse unconstrained test suite
#   - This problem is referred to as “Problem 11. Augmented Lagrangian function”
#
# Objective structure (summed over i with mod(i,5) == 0, i ∈ {5,10,15,…}):
#   exp(∏_{j=1..5} x[i+1-j])
#   + 10 * (∑_{j=1..5} x[i+1-j]^2 - 10 - λ₁)^2
#   + 10 * (x[i-3] x[i-2] - 5 x[i-1] x[i] - λ₂)^2
#   + 10 * (x[i-4]^3 + x[i-3]^3 + 1 - λ₃)^2
# with parameters:
#   λ₁ = -0.002008, λ₂ = -0.001900, λ₃ = -0.000261.
#
# Initialization (per index class mod 5):
#   i%5==1: x[i] = -2 (if i ≤ 2) else -1
#   i%5==2: x[i] =  2 (if i ≤ 2) else -1
#   i%5==3: x[i] =  2
#   i%5==4: x[i] = -1
#   i%5==0: x[i] = -1
#
# Notes:
#   - Implemented without conditionals inside @objective; indices are precomputed.
#   - Matches the ADNLPProblems formulation used for testing.
export auglag

function auglag(; n::Int = default_nvar)
  λ₁ = -0.002008
  λ₂ = -0.001900
  λ₃ = -0.000261
  
  nlp = Model()
  @variable(nlp, x[1:n])
  
  for i = 1:n
    m = mod(i, 5)
    if m == 1
      set_start_value(x[i], i <= 2 ? -2.0 : -1.0)
    elseif m == 2
      set_start_value(x[i], i <= 2 ? 2.0 : -1.0)
    elseif m == 3
      set_start_value(x[i], 2.0)
    elseif m == 4
      set_start_value(x[i], -1.0)
    else
      set_start_value(x[i], -1.0)
    end
  end
  
  # Build objective only for i where mod(i, 5) == 0 and i >= 5
  indices = [i for i = 5:n if mod(i, 5) == 0]
  
  @objective(nlp, Min,
    sum(
      exp(prod(x[i+1-j] for j = 1:5)) +
      10 * (sum(x[i+1-j]^2 for j = 1:5) - 10 - λ₁)^2 +
      10 *  (x[i-3]*x[i-2] - 5*x[i-1]*x[i] - λ₂)^2 +
      10 * (x[i-4]^3 + x[i-3]^3 + 1 - λ₃)^2
      for i in indices
    )
  )
  
  return nlp
end
