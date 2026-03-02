export dembo_gp2

function dembo_gp2(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (x[1]+1)^2 + (x[2]+1)^2 + (x[3]+1)^2
  end
  
  function c!(cx, x)
    # Constraints from geometric programming
    cx[1] = x[1] + x[2] - x[3]
    cx[2] = x[1]^2 + x[2]^2 - 1
    return cx
  end
  
  x0 = T[1.0, 1.0, 1.0]
  lcon = T[0.0, -Inf]
  ucon = T[0.0, 0.0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp2"; kwargs...)
end
