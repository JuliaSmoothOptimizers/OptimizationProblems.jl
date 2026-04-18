export eg2

"model in size `n`"
function eg2(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("eg2: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 0)

  @objective(nlp, Min, sum(sin(x[1] + x[i]^2 - 1) for i = 1:(n - 1)) + 0.5 * sin(x[n]^2))

  return nlp
end
