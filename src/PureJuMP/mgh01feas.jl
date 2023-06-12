export mgh01feas

function mgh01feas(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x1, start = -1.2)
  @variable(nlp, x2, start = 1.0)

  @objective(nlp, Min, 0)
  @constraint(nlp, 1 - x1 == 0)
  @NLconstraint(nlp, 10 * (x2 - x1^2) == 0)

  return nlp
end
