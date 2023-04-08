export hs64

function hs64(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 5 * x[1] + 50000 / x[1] + 20 * x[2] + 72000 / x[2] + 10 * x[3] + 144000 / x[3]
  end
  x0 = ones(T, 3)
  lvar = T(1e-5) * ones(T, 3)
  uvar = T(Inf) * ones(T, 3)
  function c!(cx, x)
    cx[1] = -1 + 4 / x[1] + 32 / x[2] + 120 / x[3]
    return cx
  end
  lcon = T[-Inf]
  ucon = zeros(T, 1)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs64"; kwargs...)
end
