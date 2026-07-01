export vardim

"Variable dimension problem."
function vardim(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = (1 - i / n))

  @objective(
    nlp,
    Min,
    sum((x[i] - 1)^2 for i = 1:n) +
    (sum(i * (x[i] - 1) for i = 1:n))^2 +
    (sum(i * (x[i] - 1) for i = 1:n))^4
  )

  return nlp
end
