export hs228

function hs228(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^2 + x[2]
  end
  x0 = T[0, 0]
  function c!(cx, x)
    cx[1] = -(x[1]^2 + x[2]^2)
    return cx
  end
  A = T[-1 -1]
  lcon = T[-1; -9]
  ucon = T[Inf; Inf]
  return ADNLPModels.ADNLPModel!(f, x0, sparse(A), c!, lcon, ucon, name = "hs228"; kwargs...)
end
