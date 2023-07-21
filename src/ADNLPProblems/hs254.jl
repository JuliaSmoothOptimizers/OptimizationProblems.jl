export hs254

function hs254(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return log(x[3]) - x[2]
  end
  x0 = T[1, 1, 1]
  lvar = T[-Inf, -Inf, 1]
  uvar = T[Inf, Inf, Inf]
  function c!(cx, x)
    cx[1] = x[2]^2 + x[3]^2 - 4
    cx[2] = x[3] -1 - x[2]^2
    return cx
  end
  lcon = ucon = zeros(T, 2)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs254"; kwargs...)
end
