export rastrigin

"Rastrigin multimodal minimization problem"
function rastrigin(args...; n::Int = default_nvar, kwargs...)
  n < 1 && @warn("rastrigin: number of variables must be ≥ 1")
  n = max(1, n)

  nlp = Model()

  x0 = [0.0 for i = 1:n]
  @variable(nlp, x[i = 1:n], lower_bound = -5.12, upper_bound = 5.12, start = x0[i])

  @objective(nlp, Min, 10 * n + sum(x[i]^2 - 10 * cos(2 * π * x[i]) for i = 1:n))

  return nlp
end
