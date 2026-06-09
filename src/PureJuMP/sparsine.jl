export sparsine

"A sparse problem involving sine functions in size 'n' "
function sparsine(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(10, n)
  @adjust_nvar_warn("sparsine", n_orig, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 0.5)

  @objective(
    nlp,
    Min,
    0.5 * sum(
      i *
      (
        sin(x[i]) +
        sin(x[mod(2 * i - 1, n) + 1]) +
        sin(x[mod(3 * i - 1, n) + 1]) +
        sin(x[mod(5 * i - 1, n) + 1]) +
        sin(x[mod(7 * i - 1, n) + 1]) +
        sin(x[mod(11 * i - 1, n) + 1])
      )^2 for i = 1:n
    )
  )

  return nlp
end
