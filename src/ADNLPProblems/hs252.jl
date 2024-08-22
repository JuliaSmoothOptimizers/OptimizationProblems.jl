export hs252

function hs252(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return 1 // 100 * (x[1] - 1)^2 + (x[2] - x[1]^2)^2
  end
  x0 = T[-1, 2, 2]
  function c!(cx, x)
    cx[1] = x[1] + x[3]^2
    return cx
  end
  lcon = ucon = T[-1]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs252"; kwargs...)
end
