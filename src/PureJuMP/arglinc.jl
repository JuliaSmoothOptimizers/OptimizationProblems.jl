export arglinc

"Linear function with `n` parameters and `m` observations - rank 1, zero columns and rows"
function arglinc(args...; n::Int = default_nvar, kwargs...)
  m = 2 * n

  nlp = Model()

  @variable(nlp, x[j = 1:n], start = 1.0)

  @objective(nlp, Min, 2 + sum(((i - 1) * sum(j * x[j] for j = 2:(n - 1)) - 1)^2 for i = 2:(m - 1)))

  return nlp
end
