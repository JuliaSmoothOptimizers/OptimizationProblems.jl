export hs100

function hs100(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - 10)^2 +
           5 * (x[2] - 12)^2 +
           x[3]^4 +
           3 * (x[4] - 11)^2 +
           10 * x[5]^6 +
           7 * x[6]^2 +
           x[7]^4 - 4 * x[6] * x[7] - 10 * x[6] - 8 * x[7]
  end
  x0 = T[1, 2, 0, 4, 0, 1, 1]
  function c!(cx, x)
    cx[1] = 127 - 2 * x[1]^2 - 3 * x[2]^4 - x[3] - 4 * x[4]^2 - 5 * x[5]
    cx[2] = 282 - 7 * x[1] - 3 * x[2] - 10 * x[3]^2 - x[4] + x[5]
    cx[3] = 196 - 23 * x[1] - x[2]^2 - 6 * x[6]^2 + 8 * x[7]
    cx[4] = -4 * x[1]^2 - x[2]^2 + 3 * x[1] * x[2] - 2 * x[3]^2 - 5 * x[6] + 11 * x[7]
    return cx
  end
  lcon = zeros(T, 4)
  ucon = T(Inf) * ones(T, 4)
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs100"; kwargs...)
end
