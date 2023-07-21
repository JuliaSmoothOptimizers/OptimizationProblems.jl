export hs222

function hs222(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -x[1]
  end
  x0 = T[1.3, 0.2]
  lvar = T[0, 0]
  uvar = T[Inf, Inf]
  function c!(cx, x)
    cx[1] = (1 - x[1])^3 - x[2] + 125 // 1000
    return cx
  end
  ucon = T[Inf]
  lcon = T[0]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs222"; kwargs...)
end
