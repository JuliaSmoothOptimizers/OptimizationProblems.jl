export hs225

function hs225(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[1]^2 + x[2]^2
  end
  x0 = T[3, 1]
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2
    cx[2] = 9 * x[1]^2 + x[2]^2 
    cx[3] = x[1]^2 - x[2]
    cx[4] = x[2]^2 - x[1]
    return cx
  end
  A = T[1 1]
  lcon = vcat(1, 1, 9, zeros(T, 2))
  ucon = T(Inf) * ones(T, 5)
  return ADNLPModels.ADNLPModel!(f, x0, sparse(A), c!, lcon, ucon, name = "hs225"; kwargs...)
end
