export dembo_gp7

function dembo_gp7(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return 0.5*x[1] + 0.6*x[2] - 0.5*x[3]*x[4]
  end
  
  function c!(cx, x)
    cx[1] = x[1] + x[2] - 2*x[3] - 2*x[4]
    cx[2] = x[1]^2 + x[2]^2 - 4*x[3] - 4*x[4]
    return cx
  end
  
  x0 = T[1.0, 1.0, 1.0, 1.0]
  lcon = T[0.0, 0.0]
  ucon = T[0.0, 0.0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp7"; kwargs...)
end
