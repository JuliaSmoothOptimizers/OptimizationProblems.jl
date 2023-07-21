export hs227

function hs227(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - 2)^2 + (x[2] - 1)^2
  end
  x0 = T[0.5, 0.5]
  function c!(cx, x)
    cx[1] = -x[1]^2 + x[2]
    cx[2] = x[1] - x[2]^2
    return cx
  end
  lcon = zeros(T, 2)
  ucon = T(Inf) * ones(T, 2)
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs227"; kwargs...)
end
