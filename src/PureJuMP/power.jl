export power

"The Power problem by Oren."
function power(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 1.0)

  @objective(nlp, Min, 0.5 * (sum((i * x[i]^2) for i = 1:n))^2)

  return nlp
end
