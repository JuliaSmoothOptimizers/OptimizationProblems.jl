export cragglvy2

"The extented Cragg and Levy function in size `n`"
function cragglvy2(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("cragglvy: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 2)
  set_start_value(x[1], 1)

  @objective(
    nlp,
    Min,
    sum(
      (exp(x[2 * i - 1]) - x[2 * i])^4 +
      100 * (x[2 * i] - x[2 * i + 1])^6 +
      (tan(x[2 * i + 1] - x[2 * i + 2]))^4 +
      x[2 * i - 1]^8 +
      (x[2 * i + 2] - 1)^2 for i = 1:(div(n, 2) - 1)
    )
  )

  return nlp
end
