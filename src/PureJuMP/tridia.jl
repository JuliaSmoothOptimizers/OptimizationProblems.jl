export tridia

"Shanno's TRIDIA quadratic tridiagonal problem."
function tridia(
  args...;
  n::Int = default_nvar,
  α::Float64 = 2.0,
  β::Float64 = 1.0,
  γ::Float64 = 1.0,
  δ::Float64 = 1.0,
  kwargs...,
)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 1.0)

  @objective(nlp, Min, γ * (x[1] * δ - 1.0)^2 + sum(i * (-β * x[i - 1] + α * x[i])^2 for i = 2:n))

  return nlp
end
