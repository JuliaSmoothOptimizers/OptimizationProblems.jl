export noncvxun

function noncvxun(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(2, n)
  @adjust_nvar_warn("noncvxun", n_orig, n)

  nlp = Model()
  @variable(nlp, x[i = 1:n], start = i)

  @objective(
    nlp,
    Min,
    sum(
      (x[i] + x[mod(2 * i - 1, n) + 1] + x[mod(3 * i - 1, n) + 1])^2 +
      4.0 * cos(x[i] + x[mod(2 * i - 1, n) + 1] + x[mod(3 * i - 1, n) + 1]) for i = 1:n
    )
  )

  return nlp
end
