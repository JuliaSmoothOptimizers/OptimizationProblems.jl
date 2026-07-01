export BOX3

function BOX3(args...; n::Int = default_nvar, m::Int = 2n, kwargs...)
  m < 3 && @warn("BOX3: must have m ≥ 3")
  m = max(m, 3)

  nlp = Model()

  x0 = [0.0; 10.0; 20.0]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (exp(-0.1 * j * x[1]) - exp(-0.1 * j * x[2]) - x[3] * (exp(-0.1 * j) - exp(-j)))^2 for j = 1:m
    )
  )

  return nlp
end
