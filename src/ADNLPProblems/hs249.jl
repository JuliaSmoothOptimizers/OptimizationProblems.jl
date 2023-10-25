export hs249

function hs249(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[1]^2 + x[2]^2 + x[3]^2
  end
  x0 = T[1, 1, 1]
  lvar = T[1, -Inf, -Inf]
  uvar = T[Inf, Inf, Inf]
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2 - 1
    return cx
  end
  lcon = T[0]
  ucon = T[Inf]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs249"; kwargs...)
end
