export linsv

function linsv(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[1:2], start = 0)

  @objective(nlp, Min, x[1])

  @constraint(nlp, x[1] + x[2] >= 3)
  @constraint(nlp, x[2] >= 1)

  return nlp
end
