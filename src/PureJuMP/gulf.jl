export gulf

"Linear function with `n` parameters and `m` observations  - full rank"
function gulf(args...; n::Int = default_nvar, m::Int = 100, kwargs...)
  n = 3
  m = min(m, 100)

  nlp = Model()

  @variable(nlp, x[j = 1:n])
  set_start_value.(x, [5, 2.5, 0.15])

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (exp(-abs((25 + (-50 * log(i / 100))^(2 / 3)) * m * i * x[2])^x[3] / x[1]) - i / 100)^2 for
      i = 1:m
    )
  )

  return nlp
end
