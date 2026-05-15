export sparsine

"A sparse problem involving sine functions in size 'n' "
function sparsine(args...; n::Int = default_nvar, kwargs...)
  n < 10 && @warn("sparsine: number of variables must be ≥ 10")
  n = max(10, n)

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
