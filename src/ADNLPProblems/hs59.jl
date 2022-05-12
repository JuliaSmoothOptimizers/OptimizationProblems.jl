export hs59

function hs59(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -T(75.196) + T(3.8112) * x[1] + T(0.0020567) * x[1]^3 - T(1.0345e-5) * x[1]^4 +
           T(6.8306) * x[2] - T(0.030234) * x[1] * x[2] +
           T(1.28134e-3) * x[2] * x[1]^2 +
           T(2.266e-7) * (x[1]^4) * x[2] - T(0.25645) * x[2]^2 + T(0.0034604) * x[2]^3 -
           T(1.3514e-5) * x[2]^4 +
           T(28.106) / (x[2] + 1) +
           T(5.2375e-6) * (x[1]^2) * (x[2]^2) +
           T(6.3e-8) * (x[1]^3) * (x[2]^2) - T(7e-10) * (x[1]^3) * (x[2]^3) -
           T(3.405e-4) * x[1] * (x[2]^2) +
           T(1.6638e-6) * x[1] * (x[2]^3) +
           T(2.8673) * exp(T(0.0005) * x[1] * x[2]) - T(3.5256e-5) * (x[1]^3) * x[2] -
           T(0.12694) * x[1]^2
  end
  x0 = T[90, 10]
  lvar = zeros(T, 2)
  uvar = T[75, 65]
  function c(x)
    n = length(x)
    return [x[1] * x[2], x[2] - (x[1]^2) / 125, (x[2] - 50)^2 - 5 * (x[1] - 55)]
  end
  lcon = T[700, 0, 0]
  ucon = T(Inf) * ones(T, 3)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs59"; kwargs...)
end
