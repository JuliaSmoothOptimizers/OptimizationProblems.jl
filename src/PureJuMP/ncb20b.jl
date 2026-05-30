export ncb20b

function ncb20b(args...; n::Int = default_nvar, kwargs...)

  # indices in Luksan go from 0 to n+1
  n_orig = n
  n = max(20, n)
  @adjust_nvar_warn("ncb20b", n_orig, n)

  x0 = zeros(n)

  nlp = Model()
  @variable(nlp, x[i = 1:n], start = x0[i])

  @objective(
    nlp,
    Min,
    sum(
      (10.0 / i) * (sum(x[i + j - 1] / (1 + x[i + j - 1]^2) for j = 1:20))^2 -
      0.2 * sum(x[i + j - 1] for j = 1:20) for i = 1:(n - 19)
    ) + sum(100.0 * x[i]^4 + 2.0 for i = 1:n)
  )

  return nlp
end
