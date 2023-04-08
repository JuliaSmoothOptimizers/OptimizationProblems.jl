export hs59

function hs59(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    Ti = eltype(x)
    return -Ti(75.196) + Ti(3.8112) * x[1] + Ti(0.0020567) * x[1]^3 - Ti(1.0345e-5) * x[1]^4 +
           Ti(6.8306) * x[2] - Ti(0.030234) * x[1] * x[2] +
           Ti(1.28134e-3) * x[2] * x[1]^2 +
           Ti(2.266e-7) * (x[1]^4) * x[2] - Ti(0.25645) * x[2]^2 + Ti(0.0034604) * x[2]^3 -
           Ti(1.3514e-5) * x[2]^4 +
           Ti(28.106) / (x[2] + 1) +
           Ti(5.2375e-6) * (x[1]^2) * (x[2]^2) +
           Ti(6.3e-8) * (x[1]^3) * (x[2]^2) - Ti(7e-10) * (x[1]^3) * (x[2]^3) -
           Ti(3.405e-4) * x[1] * (x[2]^2) +
           Ti(1.6638e-6) * x[1] * (x[2]^3) +
           Ti(2.8673) * exp(Ti(0.0005) * x[1] * x[2]) - Ti(3.5256e-5) * (x[1]^3) * x[2] -
           Ti(0.12694) * x[1]^2
  end
  x0 = T[90, 10]
  lvar = zeros(T, 2)
  uvar = T[75, 65]
  function c!(cx, x)
    cx[1] = x[1] * x[2] - 700
    cx[2] = x[2] - (x[1]^2) / 125
    cx[3] = (x[2] - 50)^2 - 5 * (x[1] - 55)
    return cx
  end
  lcon = zeros(T, 3)
  ucon = T(Inf) * ones(T, 3)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs59"; kwargs...)
end
