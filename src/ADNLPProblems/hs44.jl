export hs44

function hs44(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1] - x[2] - x[3] - x[1] * x[3] + x[1] * x[4] + x[2] * x[3] - x[2] * x[4]
  end
  x0 = zeros(T, 4)
  lvar = zeros(T, 4)
  uvar = T(Inf) * ones(T, 4)
  lcon = -T(Inf) * ones(T, 6)
  ucon = T[8, 12, 12, 8, 8, 5]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 2; 2; 3; 3; 4; 4; 5; 5; 6; 6],
    [1; 2; 1; 2; 1; 2; 3; 4; 3; 4; 3; 4],
    T[1; 2; 4; 1; 3; 4; 2; 1; 1; 2; 1; 1],
    lcon,
    ucon,
    name = "hs44",
    lin = 1:6;
    kwargs...,
  )
end
