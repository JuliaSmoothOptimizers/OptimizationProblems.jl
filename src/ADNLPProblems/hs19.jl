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
    cx[1] = (x[1] - 5)^2 + (x[2] - 5)^2 - 100
    cx[2] = (x[2] - 5)^2 + (x[1] - 6)^2 - 8281 // 100
    return cx
  end
  lcon = [zero(T), -T(Inf)]
  ucon = [T(Inf), zero(T)]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs19"; kwargs...)
end
