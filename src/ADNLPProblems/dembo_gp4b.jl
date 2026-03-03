export dembo_gp4b

function dembo_gp4b(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T
  x0 = ones(T, 5)

  function f(x)
    return -(x[1] * x[2] * x[3] * x[4] * x[5])
  end

  # Linear constraint: 2x₁ + 3x₂ + x₃ + 4x₄ + x₅ = 20 in sparse format
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    [1; 1; 1; 1; 1],  # row indices (all in row 1)
    [1; 2; 3; 4; 5],  # column indices
    T[2; 3; 1; 4; 1], # coefficients
    T[20.0],
    T[20.0],
    lvar = fill(T(0.001), 5),
    uvar = fill(T(Inf), 5),
    T[20.0];
    name = "dembo_gp4b",
    kwargs...
  )
end
