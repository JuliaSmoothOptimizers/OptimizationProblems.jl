export dembo_gp3

function dembo_gp3(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[1] + x[2]/x[1] + x[3]/x[1]^2 + x[4]
  end
  
  function c!(cx, x)
    cx[1] = x[3] - x[1]^3
    cx[2] = x[2] - 2*x[1]^2
    cx[3] = x[3] + 1/x[4] - 2
  end
  
  x0 = T[1.0, 2.0, 1.0, 1.0]
  lcon = T[0.0, 0.0, 0.0]
  ucon = T[0.0, 0.0, 0.0]
  lvar = fill(T(0.001), 4)
  uvar = fill(T(Inf), 4)
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon; lvar = lvar, uvar = uvar, name = "dembo_gp3", kwargs...)
end
