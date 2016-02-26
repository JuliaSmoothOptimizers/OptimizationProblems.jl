using OptimizationProblems
using Base.Test

# Test that every problem can be instantiated.
for prob in names(OptimizationProblems)
  prob == :OptimizationProblems && continue
  println(prob)
  prob_fn = eval(prob)
  prob_fn()
end


# Now test that every problem succeeds in evaluatig f, ∇f and ∇²f*v

using NLPModels

# n = 1 triggers all warnings for incompatible dimensions
n = 1

for prob in names(OptimizationProblems)
    prob == :OptimizationProblems && continue
    prob_fn = eval(prob)
    println(prob)

    nlp = NLPModel(prob_fn(n))
    x0 = nlp.jmodel.colVal
    dim = length(x0)

    @printf("dimension = %7d\n", dim)
    @printf("f(x₀) = %15.7e\n", obj(nlp, x0))
    g = grad(nlp, x0)
    @printf("‖∇f(x₀)‖ = %7.1e\n", norm(g))
    gHg = dot(g, hprod(nlp, x0, g))
    @printf("∇f(x₀)ᵀ ∇²f(x₀) ∇f(x₀) = %8.1e\n", gHg)
end
