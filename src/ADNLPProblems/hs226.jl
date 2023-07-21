export hs226

function hs226(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -x[1] * x[2]
  end
  x0 = T[0.8, 0.05]
  lvar = T[0, 0]
  uvar = T[Inf, Inf]
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2
    cx[2] = 1 - x[1]^2 - x[2]^2
    return cx
  end
  lcon = zeros(T, 2)
  ucon = T(Inf) * ones(T, 2)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs226"; kwargs...)
end
