export penalty1

"Linear function with `n` parameters and `m` observations  - full rank"
function penalty1(args...; n::Int = default_nvar, kwargs...)
  a = sqrt(1e-5)

  nlp = Model()

  @variable(nlp, x[j = 1:n])
  set_start_value.(x, [j for j = 1:n])

  @objective(
    nlp,
    Min,
    1 / 2 * sum((a * (x[i] - 1))^2 for i = 1:n) + 1 / 2 * (sum(x[j]^2 for j = 1:n) - 1 / 4)^2
  )

  return nlp
end
