export hs220

function hs220(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[1]
  end
  x0 = T[25000, 25000]
  lvar = T[1, 0]
  uvar = T[Inf, Inf]
  function c!(cx, x)
    cx[1] = (x[1] - 1)^3 - x[2]
    return cx
  end
  lcon = ucon = T[0]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs220"; kwargs...)
end
