export hs89

function hs89(; type::Type{T} = Float64, kwargs...) where {T}
  # First 30 positive roots of tan(μ) = μ
  mu = T[
    0.8603335890193798,
    3.425618459481728,
    6.437298179171945,
    9.529334405361963,
    12.645287223856588,
    15.771284874815820,
    18.902409956860000,
    22.036496727938500,
    25.172446326646600,
    28.309642854452000,
    31.447714637546200,
    34.586424215288900,
    37.725612827776500,
    40.865170330488000,
    44.005017920830800,
    47.145097736761000,
    50.285366337773600,
    53.425790477394600,
    56.566344279821500,
    59.707007305335400,
    62.847763194454400,
    65.988598698490300,
    69.129502973895200,
    72.270467060308900,
    75.411483488848100,
    78.552545984242900,
    81.693649235601600,
    84.834788718042200,
    87.975960552493200,
    91.117161394464700,
  ]

  # Precomputed coefficients A_j = 2 sin(μ_j) / (μ_j + sin(μ_j) cos(μ_j))
  A = [2 * sin(mu[j]) / (mu[j] + sin(mu[j]) * cos(mu[j])) for j = 1:30]

  # Objective: φ(x) = ∑_{j=1}^{30} A_j ρ_j(x)
  function f(x::AbstractVector{T})
    s = zero(T)
    r = x[1]^2 + x[2]^2 + x[3]^2
    for j = 1:30
      μ² = mu[j]^2
      exp_r = exp(-μ² * r)
      ρ = - (exp_r + 2*exp(-μ²*(x[2]^2 + x[3]^2)) + 2*exp(-μ²*x[3]^2) + 1) / μ²
      s += A[j] * ρ
    end
    return s
  end

  # Equality constraint c(x) = 0
  # Full expression with cross terms (double sum over i < j)
  function c!(cx::AbstractVector{T}, x::AbstractVector{T})
    r = x[1]^2 + x[2]^2 + x[3]^2
    termA = zero(T)
    termB = zero(T)
    # Compute termA and termB directly, no heap allocation
    for j = 1:30
      μ = mu[j]
      μ² = μ^2
      exp_r = exp(-μ² * r)
      exp_r23 = exp(-μ² * (x[2]^2 + x[3]^2))
      exp_r3 = exp(-μ² * x[3]^2)
      ρj = - (exp_r + 2*exp_r23 + 2*exp_r3 + 1) / μ²
      termA += A[j]^2 * ρj^2 * (sin(2*μ)/(2*μ) + one(T)) / 2
    end
    for i = 1:29
      μi = mu[i]
      μi² = μi^2
      exp_ri = exp(-μi² * r)
      exp_ri23 = exp(-μi² * (x[2]^2 + x[3]^2))
      exp_ri3 = exp(-μi² * x[3]^2)
      ρi = - (exp_ri + 2*exp_ri23 + 2*exp_ri3 + 1) / μi²
      for j = (i + 1):30
        μj = mu[j]
        μj² = μj^2
        exp_rj = exp(-μj² * r)
        exp_rj23 = exp(-μj² * (x[2]^2 + x[3]^2))
        exp_rj3 = exp(-μj² * x[3]^2)
        ρj = - (exp_rj + 2*exp_rj23 + 2*exp_rj3 + 1) / μj²
        denom_plus = μi + μj
        denom_minus = μi - μj
        sin_plus = iszero(denom_plus) ? one(T) : sin(denom_plus)/denom_plus
        sin_minus = iszero(denom_minus) ? one(T) : sin(denom_minus)/denom_minus
        termB += A[i] * A[j] * ρi * ρj * (sin_plus + sin_minus)
      end
    end
    cx[1] = termA + termB - T(2)/15
    return cx
  end

  # Starting point (common in literature / CUTE)
  x0 = T[0.5, -0.5, 0.5]

  # One equality constraint c(x) = 0
  lcon = ucon = T[0]

  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    c!,
    lcon,
    ucon;
    name = "hs89",
    lin = Int[],   # no linear constraints
    kwargs...,
  )
end
