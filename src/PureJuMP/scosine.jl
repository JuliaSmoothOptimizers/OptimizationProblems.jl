export scosine

"Another function with nontrivial groups and repetitious elements in size 'n' "
function scosine(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("scosine: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()
  p = zeros(n)
  for i = 1:n
    p[i] = exp(6.0 * (i - 1) / (n - 1))
  end

  @variable(nlp, x[i = 1:n], start = 1.0 / p[i])

  @objective(nlp, Min, sum(cos(p[i]^2 * x[i]^2 - p[i + 1] * x[i + 1] / 2.0) for i = 1:(n - 1)))

  return nlp
end
