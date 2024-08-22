export hs234

function hs234(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (x[2] - x[1])^4 - (1 - x[1])
  end
  x0 = T[0, 0]
  lvar = T[0.2, 0.2]
  uvar = T[2, 2]
  function c!(cx, x)
    cx[1] = -x[1]^2 - x[2]^2
    return cx
  end
  lcon = T[-1]
  ucon = T[Inf]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs234"; kwargs...)
end
