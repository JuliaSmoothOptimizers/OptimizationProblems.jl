export hs61

function hs61(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 4 * x[1]^2 + 2 * x[2]^2 + 2 * x[3]^2 - 33 * x[1] + 16 * x[2] - 24 * x[3]
  end
  x0 = zeros(T, 3)
  function c!(cx, x)
    cx[1] = 3 * x[1] - 2 * x[2]^2 - 7
    cx[2] = 4 * x[1] - x[3]^2 - 11
    return cx
  end
  lcon = zeros(T, 2)
  ucon = zeros(T, 2)
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs61"; kwargs...)
end
