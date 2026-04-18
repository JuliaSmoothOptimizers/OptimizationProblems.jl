export dqrtic

"Diagonal quartic model in size `n`"
function dqrtic(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 2)

  @objective(nlp, Min, sum((x[i] - i)^4 for i = 1:n))

  return nlp
end
