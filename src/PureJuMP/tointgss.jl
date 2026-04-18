export tointgss

"Toint's Gaussian problem in size 'n' "
function tointgss(args...; n::Int = default_nvar, kwargs...)
  n < 3 && @warn("tointgss: number of variables must be ≥ 3")
  n = max(3, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 3.0)

  @objective(
    nlp,
    Min,
    sum(
      (10.0 / (n + 2) + x[i + 2]^2) * (2.0 - exp(-(x[i] - x[i + 1])^2 / (0.1 + x[i + 2]^2))) for
      i = 1:(n - 2)
    )
  )

  return nlp
end
