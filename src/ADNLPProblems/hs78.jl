export hs78

function hs78(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return prod(x[i] for i = 1:5)
  end
  x0 = T[-2, 1.5, 2, -1, -1]
  function c!(cx, x)
    cx[1] = sum(x[i]^2 for i = 1:5)
    cx[2] = x[2] * x[3] - 5 * x[4] * x[5]
    cx[3] = x[1]^3 + x[2]^3 + 1
    return cx
  end
  lcon = ucon = T[10, 0, 0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs78"; kwargs...)
end
