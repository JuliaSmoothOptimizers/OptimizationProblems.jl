export dqdrtic

"Diagonal quadratic problem"
function dqdrtic(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[j = 1:n], start = 3.0)

  @objective(nlp, Min, sum(x[i]^2 + 100 * (x[i + 1]^2 + x[i + 2]^2) for i = 1:(n - 2)))

  return nlp
end
