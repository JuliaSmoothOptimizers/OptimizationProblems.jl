export dembo_gp4a

function dembo_gp4a(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[1] * x[2] * x[3] * x[4] * x[5]
  end
  
  function c!(cx, x)
    cx[1] = x[1] + x[2] + x[3] + x[4] + x[5] - 5
    cx[2] = x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 + x[5]^2 - 5
    return cx
  end
  
  x0 = T[1.0, 1.0, 1.0, 1.0, 1.0]
  lcon = T[0.0, 0.0]
  ucon = T[0.0, 0.0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp4a"; kwargs...)
end
