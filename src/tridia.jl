#   Shanno's TRIDIA quadratic tridiagonal problem.
#
#   Source: problem 8 in
#   Ph.L. Toint,
#   "Test problems for partially separable optimization and results
#   for the routine PSPMIN",
#   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.
#
#   See also Buckley#40 (p.96)
#
#   classification QUR2-AN-V-0
#
#   This problem is decomposed in n linear groups, the last n-1 of which
#   are 2 x 2 and singular.

export tridia

"Shanno's TRIDIA quadratic tridiagonal problem."
function tridia(n::Int=10000, α::Float64=2.0, β::Float64=1.0, γ::Float64=1.0, δ::Float64=1.0)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=1.0)

  @NLobjective(
    nlp,
    Min,
    γ * (x[1] * δ - 1.0)^2 + sum(i * (-β * x[i-1] + α * x[i])^2 for i=2:n)
  )

  return nlp
end
