export hs19

function hs19(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - 10)^3 + (x[2] - 20)^3
  end
  x0 = T[20.1, 5.84]
  lvar = T[13, 0]
  uvar = T[100, 100]
  function c!(cx, x)
    cx[1] = (x[1]^2 - 10 * x[1]) + (x[2]^2 - 10 * x[2])
    cx[2] = (x[2]^2 - 10 * x[2]) + (x[1]^2 - 12 * x[1])
    return cx
  end
  lcon = [50, -T(Inf)]
  ucon = [T(Inf), 2181 // 100]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs19"; kwargs...)
end
