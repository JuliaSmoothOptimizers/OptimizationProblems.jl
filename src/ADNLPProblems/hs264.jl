export hs264

function hs264(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^2 + x[2]^2 + 2 * x[3]^2 + x[4]^2 - 5 * x[1] - 5 * x[2] - 21 * x[3] + 7 * x[4]
  end
  x0 = T[0, 0, 0, 0]
  function c!(cx, x)
    cx[1] = -x[1]^2 - x[2]^2 - x[3]^2 - x[4]^2 - x[1] + x[2] + x[3] + x[4]
    cx[2] = -x[1]^2 - 2 * x[2]^2 - x[3]^2 - 2 * x[4]^2 + x[1] + x[4]
    cx[3] = -2 * x[1]^2 - x[2]^2 - x[3]^2 - 2 * x[1] + x[2] + x[4]
    return cx
  end
  lcon = T[-8, -9, -5]
  ucon = T[Inf, Inf, Inf]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs264"; kwargs...)
end
