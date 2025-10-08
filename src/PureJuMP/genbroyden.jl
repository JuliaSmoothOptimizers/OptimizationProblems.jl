export genbroyden

"""JuMP model counterpart for genbroyden (placeholder matching ADNLPProblems)."""
function genbroyden(; n::Int = default_nvar, alpha::Float64 = 2.0)
  nlp = Model()
  @variable(nlp, x[1:n], start = -1.0)
  @objective(nlp, Min, 0.5 * sum(((3 - alpha * x[i]) * x[i] - (i>1 ? x[i-1] : 0) - (i<n ? 2*x[i+1] : 0) + 1)^2 for i=1:n))
  return nlp
end
