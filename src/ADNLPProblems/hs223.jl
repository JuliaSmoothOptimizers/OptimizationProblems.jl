export hs223

function hs223(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return -x[1]
  end
  x0 = T[0.1, 3.3]
  lvar = T[0, 0]
  uvar = T[10, 10]
  function c!(cx, x)
    cx[1] = exp(exp(x[1]))
    cx[2] = x[2] - exp(exp(x[1]))
    return cx
  end
  ucon = T[Inf; Inf]
  lcon = T[0; 0]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs223"; kwargs...)
end
