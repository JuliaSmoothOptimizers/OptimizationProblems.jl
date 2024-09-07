export hs248

function hs248(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return -x[2]
  end
  x0 = T[-0.1, -1, 0.1]
  lcon = T[-1; 1]
  ucon = T[Inf; 1]
  A = T[
    1 -2
  ]
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2 + x[3]^2
    return cx
  end
  return ADNLPModels.ADNLPModel!(f, x0, sparse(A), c!, lcon, ucon, name = "hs248"; kwargs...)
end
