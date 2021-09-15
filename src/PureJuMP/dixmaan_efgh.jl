# The Dixon-Maany test problem (version E by default)
#
#   Source:
#   L. C. W. Dixon and Z. Maany,
#   A family of test problems with sparse Hessians for unconstrained
#   optimization,
#   TR 206, Numerical Optimization Centre, Hatfield Polytechnic, 1988.
#
# See also
#
#   problems 11, 12, 13, 14 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   classification OUR2-AN-V-0
#
# D. Orban, Montreal, 08/2015.

export dixmaane, dixmaanf, dixmaang, dixmaanh

"Dixon-Maany function in size `n` (version E by default)"
function dixmaane(
  n::Int = 99;
  α::Float64 = 1.0,
  β::Float64 = 0.0,
  γ::Float64 = 0.125,
  δ::Float64 = 0.125,
)
  (n % 3 == 0) || @warn("dixmaan: number of variables adjusted to be a multiple of 3")
  m = max(1, div(n, 3))
  n = 3 * m

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 2)

  @NLobjective(
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
dixmaanf(n::Int = 99) = dixmaane(n, α = 1.0, β = 0.0625, γ = 0.0625, δ = 0.0625)

"Dixon-Maany function in size `n` (version G)"
dixmaang(n::Int = 99) = dixmaane(n, α = 1.0, β = 0.125, γ = 0.125, δ = 0.125)

"Dixon-Maany function in size `n` (version H)"
dixmaanh(n::Int = 99) = dixmaane(n, α = 1.0, β = 0.26, γ = 0.26, δ = 0.26)
