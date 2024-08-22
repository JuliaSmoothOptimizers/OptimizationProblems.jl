export hs33

function hs33(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - 1) * (x[1] - 2) * (x[1] - 3) + x[3]
  end
  x0 = T[0, 0, 3]
  uvar = T[Inf, Inf, 5]
  lvar = zeros(T, 3)
  function c!(cx, x)
    cx[2] = -x[3]^2 + x[2]^2 + x[1]^2
    cx[1] = x[1]^2 + x[2]^2 + x[3]^2
    return cx
  end
  lcon = [4, -T(Inf)]
  ucon = [T(Inf), 0]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs33"; kwargs...)
end
