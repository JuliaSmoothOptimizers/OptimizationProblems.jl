export hs108

function hs108(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -1 // 2 *
           (x[1] * x[4] - x[2] * x[3] + x[3] * x[9] - x[5] * x[9] + x[5] * x[8] - x[6] * x[7])
  end
  x0 = ones(T, 9)
  lvar = T[-Inf, -Inf, -Inf, -Inf, -Inf, -Inf, -Inf, -Inf, 0]
  uvar = T(Inf) * ones(T, 9)
  function c!(cx, x)
    cx[1] = 1 - x[3]^2 - x[4]^2
    cx[2] = 1 - x[5]^2 - x[6]^2
    cx[3] = 1 - (x[1] - x[5])^2 - (x[2] - x[6])^2
    cx[4] = 1 - (x[1] - x[7])^2 - (x[2] - x[8])^2
    cx[5] = 1 - (x[3] - x[5])^2 - (x[4] - x[6])^2
    cx[6] = 1 - (x[3] - x[7])^2 - (x[4] - x[8])^2
    cx[7] = x[3] * x[9]
    cx[8] = x[5] * x[8] - x[6] * x[7]
    cx[9] = 1 - x[9]^2
    cx[10] = 1 - x[1]^2 - (x[2] - x[9])^2
    cx[11] = x[1] * x[4] - x[2] * x[3]
    cx[12] = -x[5] * x[9]
    return cx
  end
  lcon = zeros(T, 12)
  ucon = T(Inf) * ones(T, 12)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs108"; kwargs...)
end
