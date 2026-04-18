export engval1

"The Engval1 model in size `n`"
function engval1(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("engval1: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 2)

  @objective(nlp, Min, sum((x[i]^2 + x[i + 1]^2)^2 - 4 * x[i] + 3 for i = 1:(n - 1)))

  return nlp
end
