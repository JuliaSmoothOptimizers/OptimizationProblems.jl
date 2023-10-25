export bt1

function bt1(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return 100 * x[1]^2 + 100 * x[2]^2 - x[1] - 100
  end
  x0 = T[0.08, 0.06]
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2 - 1
    return cx
  end
  lcon = zeros(T, 1)
  ucon = zeros(T, 1)
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "bt1"; kwargs...)
end
