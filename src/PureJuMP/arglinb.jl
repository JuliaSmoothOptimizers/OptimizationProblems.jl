export arglinb

"Linear function with `n` parameters and `m` observations - rank 1"
function arglinb(args...; n::Int = default_nvar, m::Int = 2n, kwargs...)
  m < n && @warn("arglinb: must have m ≥ n")
  m = max(m, n)

  nlp = Model()

  @variable(nlp, x[j = 1:n], start = 1.0)

  @objective(nlp, Min, 0.5 * sum((i * sum(j * x[j] for j = 1:n) - 1)^2 for i = 1:m))

  return nlp
end
