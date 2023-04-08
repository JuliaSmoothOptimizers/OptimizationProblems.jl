export hs72

function hs72(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 1 + x[1] + x[2] + x[3] + x[4]
  end
  x0 = ones(T, 4)
  lvar = T(0.001) * ones(T, 4)
  uvar = T[(5 - i) * 1e5 for i = 1:4]
  function c!(cx, x)
    cx[1] = -0.0401 + 4 / x[1] + 2.25 / x[2] + 1 / x[3] + 0.25 / x[4]
    cx[2] = -0.010085 + 0.16 / x[1] + 0.36 / x[2] + 0.64 / x[3] + 0.64 / x[4]
    return cx
  end
  lcon = -T(Inf) * ones(T, 2)
  ucon = zeros(T, 2)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs72"; kwargs...)
end
