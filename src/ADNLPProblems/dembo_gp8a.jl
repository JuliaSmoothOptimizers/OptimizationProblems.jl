export dembo_gp8a

function dembo_gp8a(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (x[1] - 10)^2 + 5*(x[2] - 12)^2 + x[3]^4 + 3*(x[4] - 11)^2 + 10*x[5]^6 + 7*x[6]^2 + x[7]^4 - 4*x[6]*x[7] - 10*x[6] - 8*x[7]
  end
  
  function c!(cx, x)
    cx[1] = 2*x[1]^2 + 3*x[2]^4 + x[3] + 4*x[4]^2 + 5*x[5] + 127
    cx[2] = 7*x[1] + 8*x[2] + x[3]^2 + 100 - 3*x[4]
    cx[3] = 23*x[1]^2 + x[2]^2 + 6*x[6]^2 - 8*x[7] - 196
    cx[4] = 4*x[1]^2 + x[2]^2 - 3*x[1]*x[2] + 2*x[3]^2 + 5*x[6] - 11*x[7] - 40
    return cx
  end
  
  x0 = T[2.0, 3.0, -1.0, 1.0, 2.0, 9.9, 1.4]
  lcon = T[-Inf, -Inf, -Inf, -Inf]
  ucon = T[0.0, 0.0, 0.0, 0.0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp8a"; kwargs...)
end
