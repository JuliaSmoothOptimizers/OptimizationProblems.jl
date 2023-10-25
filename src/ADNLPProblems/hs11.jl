export hs11

function hs11(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  x0 = T[4.9; 0.1]
  f(x) = (x[1] - 5)^2 + x[2]^2 - 25
  function c!(cx, x)
    cx[1] = x[1]^2 - x[2]
    return cx
  end
  lcon = -T[Inf]
  ucon = T[0.0]

  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs11"; kwargs...)
end
