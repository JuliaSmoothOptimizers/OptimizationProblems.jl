export arwhead

"Arrow head model in size `n`"
function arwhead(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("arwhead: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 1.0)

  @objective(nlp, Min, sum((x[i]^2 + x[n]^2)^2 - 4 * x[i] + 3 for i = 1:(n - 1)))

  return nlp
end
