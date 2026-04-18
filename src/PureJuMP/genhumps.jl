export genhumps

function genhumps(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  ζ = 20.0
  x0 = -506.2 * ones(n)
  x0[1] = -506.0

  @variable(nlp, x[i = 1:n], start = x0[i])

  @objective(
    nlp,
    Min,
    sum((sin(ζ * x[i])^2 * sin(ζ * x[i + 1])^2 + 0.05 * (x[i]^2 + x[i + 1]^2)) for i = 1:(n - 1))
  )

  return nlp
end
