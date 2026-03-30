# Hock and Schittkowski problem number 89
#
#   Source:
#   Problem 89 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification QGR-P1-(1,...,6)
#
#   Implementation: AI/JSO, 03/2026

export hs89

"HS89 model"
function hs89_jump(
  optimizer = Ipopt.Optimizer,
  optimizer_attributes = Dict(
    "tol" => 1e-10,
    "print_level" => 5,
    "max_iter" => 10000,
    "acceptable_tol" => 1e-8,
  ),
)
  model = Model(optimizer)

  # Apply solver-specific options
  for (k, v) in optimizer_attributes
    set_optimizer_attribute(model, k, v)
  end

  # Variables (no simple bounds in standard HS89, but loose ones help numerics)
  @variable(model, x1)
  @variable(model, x2)
  @variable(model, x3)

  # First 30 positive roots of tan(μ) = μ
  mu = [
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

  # Coefficients Aⱼ
  A = [2 * sin(mu[j]) / (mu[j] + sin(mu[j]) * cos(mu[j])) for j = 1:30]

  # Precompute nothing — JuMP + AD will handle it

  # Helper expressions for ρⱼ (makes model more readable)
  @expression(
    model,
    ρ[j = 1:30],
    let μ² = mu[j]^2, r = x1^2 + x2^2 + x3^2, r23 = x2^2 + x3^2, r3 = x3^2;
      -(exp(-μ² * r) + 2*exp(-μ² * r23) + 2*exp(-μ² * r3) + 1) / μ²
    end
  )

  # Objective: ∑ Aⱼ ρⱼ
  @NLobjective(model, Min, sum(A[j] * ρ[j] for j = 1:30))

  # Constraint: termA + termB = 2/15
  @NLconstraint(
    model,
    eq,
    sum(A[j]^2 * ρ[j]^2 * (sin(2*mu[j])/(2*mu[j]) + 1)/2 for j = 1:30) + sum(
      sum(
        A[i] *
        A[j] *
        ρ[i] *
        ρ[j] *
        (sin(mu[i] + mu[j]) / (mu[i] + mu[j]) + sin(mu[i] - mu[j]) / (mu[i] - mu[j])) for
        j = (i + 1):30
      ) for i = 1:29
    ) == 2/15
  )

  # Good starting point (from CUTE / literature)
  set_start_value(x1, 0.5)
  set_start_value(x2, -0.5)
  set_start_value(x3, 0.5)
  return model
end
