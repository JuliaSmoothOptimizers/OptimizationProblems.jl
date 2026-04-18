export liarwhd

function liarwhd(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("liarwhd: number of variables must be ≥ 4")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 4.0)

  @objective(nlp, Min, sum(4.0 * (x[i]^2 - x[1])^2 + (x[i] - 1)^2 for i = 1:n))

  return nlp
end
