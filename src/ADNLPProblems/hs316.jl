export hs316

function hs316(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (x[1] - 20)^2 + (x[2] + 20)^2
  end
  function c!(cx, x)
    cx[1] = x[1]^2 / 100 + x[2]^2 / 100
    return cx
  end
  x0 = zeros(T, 2)
  lcon = ucon = T[1]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "hs316"; kwargs...)
end
