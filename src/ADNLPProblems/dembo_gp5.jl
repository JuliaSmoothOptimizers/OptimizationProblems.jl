export dembo_gp5

function dembo_gp5(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return 10*x[1]*x[2]*x[3]
  end
  
  function c!(cx, x)
    cx[1] = x[1] + 2*x[2] + 2*x[3] - 72
    cx[2] = 2*x[1] + x[2] + 2*x[3] - 100
    return cx
  end
  
  x0 = T[10.0, 10.0, 10.0]
  lcon = T[0.0, 0.0]
  ucon = T[0.0, 0.0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp5"; kwargs...)
end
