# Hock and Schittkowski problem number 89.
#
#   Source:
#   Problem 89 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification QGR-AN-3-1
#
# A. Montoison, Montreal, 05/2018.

export hs89

μ = Array{Float64}(30)
μ[1:5]   = [8.6033358901938e-01,3.4256184594817e+00,6.4372981791719e+00,9.5293344053619e+00,1.2645287223856e+01]
μ[6:10]  = [1.5771284874815e+01,1.8902409956860e+01,2.2036496727938e+01,2.5172446326646e+01,2.8309642854452e+01]
μ[11:15] = [3.1447714637546e+01,3.4586424215288e+01,3.7725612827776e+01,4.0865170330488e+01,4.4005017920830e+01]
μ[16:20] = [4.7145097736761e+01,5.0285366337773e+01,5.3425790477394e+01,5.6566344279821e+01,5.9707007305335e+01]
μ[21:25] = [6.2847763194454e+01,6.5988598698490e+01,6.9129502973895e+01,7.2270467060309e+01,7.5411483488848e+01]
μ[26:30] = [7.8552545984243e+01,8.1693649235601e+01,8.4834788718042e+01,8.7975960552493e+01,9.1117161394464e+01]

A = [2*sin(μ[j])/(μ[j] + sin(μ[j])*cos(μ[j])) for j = 1:30]

function k3(s)
  return 0.5*(1-s^2)
end

function α3(s,j)
  return A[j]*μ[j]^2*cos(μ[j]*s)
end

function ρ3(x,j)
  n = length(x)
  return (-μ[j]^(-2)*exp(-μ[j]^2*sum(x[i]^2 for i=1:n)) - 2*exp(-μ[j]^2*sum(x[i]^2 for i=2:n)) 
          + 2*(-1)^(n-1)*exp(-μ[j]^2*x[n]^2 + (-1)^n))
end

function h3(x1,x2,x3)
  x = [x1,x2,x3]
  dh3(s) = sum(α3(s,j)*ρ3(x,j) - k3(s) for j = 1:30)
  return quadgk(dh3, 0, 1)
end

"HS89 model"
function hs89(args...)
  nlp = Model()

  n = 3
  x0 = 0.5*[(-1)^(i+1) for i=1:n]
  @variable(nlp, x[i=1:n], start=x0[i])

  ϵ = 0.01
  JuMP.register(nlp, :h3, n, h3, autodiff=true)
  @NLconstraint(nlp, ϵ^2 - h3(x[1],x[2],x[3]) >= 0)

  @NLobjective(
    nlp,
    Min,
    sum(x[i]^2 for i=1:n)
    )

  return nlp
end