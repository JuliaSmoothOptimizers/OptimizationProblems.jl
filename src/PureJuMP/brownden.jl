export brownden

"Brown and Dennis function"
function brownden(args...; n::Int = default_nvar, kwargs...)
  n < 4 && @warn("brownden: must have n ≥ 4")
  n = max(n, 4)

  nlp = Model()

  x0 = [25.0, 5, -5, -1]

  @variable(nlp, x[j = 1:4], start = x0[j])

  t = Float64[i / 5 for i = 1:n]

  @objective(
    nlp,
    Min,
    sum(
      ((x[1] + t[i] * x[2] - exp(t[i]))^2 + (x[3] + x[4] * sin(t[i]) - cos(t[i]))^2)^2 for i = 1:n
    )
  )

  return nlp
end
