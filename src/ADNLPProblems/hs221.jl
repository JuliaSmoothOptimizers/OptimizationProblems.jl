export hs221

function hs221(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return -x[1]
  end
  x0 = T[0.25, 0.25]
  lvar = T[0, 0]
  uvar = T[Inf, Inf]
  function c!(cx, x)
    cx[1] = (1 - x[1])^3 - x[2]
    return cx
  end
  ucon = T[Inf]
  lcon = T[0]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs221"; kwargs...)
end
