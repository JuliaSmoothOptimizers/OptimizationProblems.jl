export sparsqur

"A sparse quartic problem in size 'n' "
function sparsqur(args...; n::Int = default_nvar, kwargs...)
  n < 10 && @warn("sparsqur: number of variables must be ≥ 10")
  n = max(10, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 0.5)

  @objective(
    nlp,
    Min,
    1 / 8 * sum(
      i *
      (
        x[i]^2 +
        x[mod(2 * i - 1, n) + 1]^2 +
        x[mod(3 * i - 1, n) + 1]^2 +
        x[mod(5 * i - 1, n) + 1]^2 +
        x[mod(7 * i - 1, n) + 1]^2 +
        x[mod(11 * i - 1, n) + 1]^2
      )^2 for i = 1:n
    )
  )

  return nlp
end
