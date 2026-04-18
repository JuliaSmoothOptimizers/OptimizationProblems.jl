export dixmaane, dixmaanf, dixmaang, dixmaanh

"Dixon-Maany function in size `n` (version E by default)"
function dixmaane(
  args...;
  n::Int = default_nvar,
  α::Float64 = 1.0,
  β::Float64 = 0.0,
  γ::Float64 = 0.125,
  δ::Float64 = 0.125,
  kwargs...,
)
  (n % 3 == 0) || @warn("dixmaan: number of variables adjusted to be a multiple of 3")
  m = max(1, div(n, 3))
  n = 3 * m

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 2)

  @objective(
    nlp,
    Min,
    1 +
    sum(i / n * α * x[i]^2 for i = 1:n) +
    sum(β * x[i]^2 * (x[i + 1] + x[i + 1]^2)^2 for i = 1:(n - 1)) +
    sum(γ * x[i]^2 * x[i + m]^4 for i = 1:(2 * m)) +
    sum(i / n * δ * x[i] * x[i + 2 * m] for i = 1:m)
  )

  return nlp
end

"Dixon-Maany function in size `n` (version F)"
dixmaanf(args...; n::Int = default_nvar, kwargs...) =
  dixmaane(n = n, α = 1.0, β = 0.0625, γ = 0.0625, δ = 0.0625)

"Dixon-Maany function in size `n` (version G)"
dixmaang(args...; n::Int = default_nvar, kwargs...) =
  dixmaane(n = n, α = 1.0, β = 0.125, γ = 0.125, δ = 0.125)

"Dixon-Maany function in size `n` (version H)"
dixmaanh(args...; n::Int = default_nvar, kwargs...) =
  dixmaane(n = n, α = 1.0, β = 0.26, γ = 0.26, δ = 0.26)
