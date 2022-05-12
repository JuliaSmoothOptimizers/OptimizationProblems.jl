export hs81

function hs81(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return exp(prod(x[i] for i = 1:5)) - T(0.5) * (x[1]^3 + x[2]^3 + 1)^2
  end
  x0 = T[-2, 2, 2, -1, -1]
  lvar = T[-2.3, -2.3, -3.2, -3.2, -3.2]
  uvar = T[2.3, 2.3, 3.2, 3.2, 3.2]
  function c(x)
    n = length(x)
    return [sum(x[i]^2 for i = 1:5), x[2] * x[3] - 5 * x[4] * x[5], x[1]^3 + x[2]^3 + 1]
  end
  lcon = T[10, 0, 0]
  ucon = T[10, 0, 0]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs81"; kwargs...)
end
