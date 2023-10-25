export hs80

function hs80(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return exp(prod(x[i] for i = 1:5))
  end
  x0 = T[-2, 2, 2, -1, -1]
  lvar = T[-2.3, -2.3, -3.2, -3.2, -3.2]
  uvar = T[2.3, 2.3, 3.2, 3.2, 3.2]
  function c!(cx, x)
    cx[1] = sum(x[i]^2 for i = 1:5) - 10
    cx[2] = x[2] * x[3] - 5 * x[4] * x[5]
    cx[3] = x[1]^3 + x[2]^3 + 1
    return cx
  end
  lcon = zeros(T, 3)
  ucon = zeros(T, 3)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs80"; kwargs...)
end
