export dembo_gp2

function dembo_gp2(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (x[1]+1)^2 + (x[2]+1)^2 + (x[3]+1)^2
  end
  
  # Nonlinear constraint: x₁² + x₂² <= 1
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2 - 1
    return cx
  end
  
  x0 = T[1.0, 1.0, 1.0]
  lcon = T[-Inf, -Inf]
  ucon = T[0.0, 0.0]
  # Linear constraint: x₁ + x₂ - x₃ <= 0 in sparse format
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    [1; 1; 1],        # row indices
    [1; 2; 3],        # column indices
    T[1; 1; -1],      # coefficients
    c!,
    lcon,
    ucon,
    name = "dembo_gp2";
    kwargs...,
  )
end
