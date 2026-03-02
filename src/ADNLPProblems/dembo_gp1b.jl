export dembo_gp1b

function dembo_gp1b(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return exp(x[1]) + exp(x[2])
  end
  
  function c!(cx, x)
    # Constraint variant
    cx[1] = (1 + exp(-x[1]))^(-1) + (1 + exp(-x[2]))^(-1)
    return cx
  end
  
  x0 = T[0.0, 0.0]
  lcon = T[1.0]
  ucon = T[Inf]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp1b"; kwargs...)
end
