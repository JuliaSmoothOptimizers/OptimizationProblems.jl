export noncvxu2

function noncvxu2(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(2, n)
  @adjust_nvar_warn("noncvxu2", n_orig, n)

  nlp = Model()
  @variable(nlp, x[i = 1:n], start = i)

  @objective(
    nlp,
    Min,
    sum(
      (x[i] + x[mod(3 * i - 2, n) + 1] + x[mod(7 * i - 3, n) + 1])^2 +
      4.0 * cos(x[i] + x[mod(3 * i - 2, n) + 1] + x[mod(7 * i - 3, n) + 1]) for i = 1:n
    )
  )

  return nlp
end
