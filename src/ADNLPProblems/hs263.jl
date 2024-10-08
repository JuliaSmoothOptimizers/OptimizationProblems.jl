export hs263

function hs263(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return -x[1]
  end
  x0 = T[10, 10, 10, 10]
  function c!(cx, x)
    cx[4] = x[2] - x[1]^3
    cx[2] = x[1]^2 - x[2]
    cx[3] = x[2] - x[1]^3 - x[3]^2
    cx[1] = x[1]^2 - x[2] - x[4]^2
    return cx
  end
  lcon = zeros(T, 4)
  ucon = T[0; Inf; 0; Inf]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs263"; kwargs...)
end
