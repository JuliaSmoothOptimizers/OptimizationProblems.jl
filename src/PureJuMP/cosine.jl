export cosine

"The cosine function in size `n`"
function cosine(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("cosine: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 1)

  @objective(nlp, Min, sum(cos(x[i]^2 - 0.5 * x[i + 1]) for i = 1:(n - 1)))

  return nlp
end
