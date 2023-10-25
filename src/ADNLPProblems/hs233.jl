export hs233

function hs233(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
  end
  x0 = T[1.2, 1]
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2 - 1 // 4
    return cx
  end
  lcon = T[0]
  ucon = T[Inf]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs233"; kwargs...)
end
