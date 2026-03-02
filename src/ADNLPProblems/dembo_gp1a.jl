export dembo_gp1a

function dembo_gp1a(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return exp(x[1]) + exp(x[2])
  end
  
  function c!(cx, x)
    # Constraint: 0.5*(1 + exp(-x1)) + 0.5*(1 + exp(-x2)) >= 1
    # Rewritten as: 0.5 + 0.5*exp(-x1) + 0.5 + 0.5*exp(-x2) - 1 >= 0
    # Or: 0.5*exp(-x1) + 0.5*exp(-x2) >= 0 (always satisfied)
    # The original form from the paper:
    cx[1] = 0.5 / (1 + exp(-x[1])) + 0.5 / (1 + exp(-x[2]))
    return cx
  end
  
  x0 = T[0.0, 0.0]
  lcon = T[1.0]
  ucon = T[Inf]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp1a"; kwargs...)
end
