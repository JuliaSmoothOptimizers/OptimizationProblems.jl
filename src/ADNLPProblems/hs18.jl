export hs18

function hs18(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^2 / 100 + x[2]^2
  end
  x0 = 2 * ones(T, 2)
  lvar = T[2, 0]
  uvar = 50 * ones(T, 2)
  function c!(cx, x)
    cx[1] = x[1] * x[2] - 25
    cx[2] = x[1]^2 + x[2]^2 - 25
    return cx
  end
  lcon = zeros(T, 2)
  ucon = T(Inf) * ones(T, 2)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs18"; kwargs...)
end
