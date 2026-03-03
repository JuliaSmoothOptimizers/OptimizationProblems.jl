export dembo_gp2

function dembo_gp2(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[1] + 2/x[1] + 2*x[2] + x[3]
  end

  # Nonlinear constraints:
  # x₁x₂ = 1
  # x₂ + 1/x₃ = 2
  function c!(cx, x)
    cx[1] = x[1] * x[2] - 1
    cx[2] = x[2] + 1/x[3] - 2
    return cx
  end

  x0 = T[1.0, 1.0, 1.0]
  lvar = fill(T(0.001), 3)
  uvar = fill(T(Inf), 3)
  lcon = T[0.0, 0.0]
  ucon = T[0.0, 0.0]
  
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    c!,
    lcon,
    ucon,
    name = "dembo_gp2";
    kwargs...,
  )
end
