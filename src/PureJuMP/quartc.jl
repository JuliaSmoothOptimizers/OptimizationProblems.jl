export quartc

"A simple quartic function."
function quartc(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 2.0)

  @objective(nlp, Min, sum((x[i] - i)^4 for i = 1:n))

  return nlp
end
