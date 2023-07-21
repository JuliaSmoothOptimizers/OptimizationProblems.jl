export hs247

function hs247(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function v(x1, x2)
    vx = zero(eltype(x1))
    vx += (x1 > 0) *atan(x2 / x1) * 1 / (2 * pi)
    vx += (x1 < 0) * (1 // 2 + atan(x2 / x1) / (2 * pi))
    # ifelse(x1 > 0, 1 / (2 * pi) * atan(x2 / x1), 1/2 + 1 / (2 * pi) * atan(x2 / x1))
    return vx
  end
  function f(x)
    return 100 * (x[3] - 10 * v(x[1], x[2]))^2 + (sqrt(x[1]^2 + x[2]^2) - 1)^2 + x[3]^2
  end
  x0 = T[-1, 0, 0]
  lvar = T[0.1, -Inf, -2.5]
  uvar = T[Inf, Inf, 7.5]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs247"; kwargs...)
end
