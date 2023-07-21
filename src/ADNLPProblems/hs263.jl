export hs263

function hs263(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -x[1]
  end
  x0 = T[10, 10, 10, 10]
  function c!(cx, x)
    cx[1] = x[2] - x[1]^3
    cx[2] = x[1]^2 - x[2]
    cx[3] = x[2] - x[1]^3 - x[3]^2
    cx[4] = x[1]^2 - x[2] - x[4]^2
    return cx
  end
  lcon = zeros(T, 4)
  ucon = T[Inf; Inf; 0; 0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs263"; kwargs...)
end
