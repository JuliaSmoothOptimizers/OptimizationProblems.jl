export hs29

function hs29(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -x[1] * x[2] * x[3]
  end
  x0 = ones(T, 3)
  function c!(cx, x)
    cx[1] = x[1]^2 + 2 * x[2]^2 + 4 * x[3]^2 - 48
    return cx
  end
  lcon = [-T(Inf)]
  ucon = zeros(T, 1)
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs29"; kwargs...)
end
