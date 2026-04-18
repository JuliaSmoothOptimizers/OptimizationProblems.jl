export woods

"The extended Woods problem `n` "
function woods(args...; n::Int = default_nvar, kwargs...)
  (n % 4 == 0) || @warn("woods: number of variables adjusted to be a multiple of 4")
  n = 4 * max(1, div(n, 4))

  nlp = Model()

  x0 = -3 * ones(n)
  x0[2 * (collect(1:div(n, 2)))] .= -1.0

  @variable(nlp, x[i = 1:n])
  set_start_value.(x, x0)

  @objective(
    nlp,
    Min,
    sum(
      100 * (x[4 * i - 2] - x[4 * i - 3]^2)^2 +
      (1 - x[4 * i - 3])^2 +
      90 * (x[4 * i] - x[4 * i - 1]^2)^2 +
      (1 - x[4 * i - 1])^2 +
      10 * (x[4 * i - 2] + x[4 * i] - 2)^2 +
      0.1 * (x[4 * i - 2] - x[4 * i])^2 for i = 1:div(n, 4)
    )
  )

  return nlp
end
