export biggs6

function biggs6(args...; n::Int = default_nvar, m::Int = 13, kwargs...)
  m = max(6, m)
  z = [i / 10 for i = 1:m]
  y = [exp(-zi) - 5 * exp(-10 * zi) + 3 * exp(-4 * zi) for zi in z]
  nlp = Model()
  x0 = [1.0; 2.0; 1.0; 1.0; 1.0; 1.0]
  @variable(nlp, x[i = 1:6], start = x0[i])
  @objective(
    nlp,
    Min,
    sum(
      x[3] * exp(-x[1] * z[i]) - x[4] * exp(-x[2] * z[i]) + x[6] * exp(-x[5] * z[i]) - y[i] for
      i = 1:m
    )
  )
  return nlp
end
