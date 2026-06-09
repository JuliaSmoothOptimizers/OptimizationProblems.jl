export argtrig

"Linear function with `n` parameters and `m` observations  - full rank"
function argtrig(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[j = 1:n], start = 1 / n)

  @objective(nlp, Min, n - sum(cos(x[j]) + j * (1 - cos(x[j])) - sin(x[j]) for j = 1:n))

  return nlp
end
