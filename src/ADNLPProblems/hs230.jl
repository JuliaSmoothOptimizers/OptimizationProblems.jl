export hs230

function hs230(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[2]
  end
  x0 = T[0, 0]
  function c!(cx, x)
    cx[1] = -2 * x[1]^2 + x[1]^3 + x[2]
    cx[2] = -2 * (1 - x[1])^2 + (1 - x[1])^3 + x[2]
    return cx
  end
  lcon = zeros(T, 2)
  ucon = T[Inf; Inf]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs230"; kwargs...)
end
