export chnrosnb_mod

function chnrosnb_mod(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("chnrosnb: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = -1.0)

  @objective(
    nlp,
    Min,
    16 * sum((x[i - 1] - x[i]^2)^2 * (1.5 + sin(i))^2 for i = 2:n) +
    sum((1.0 - x[i])^2 for i = 2:n)
  )

  return nlp
end
