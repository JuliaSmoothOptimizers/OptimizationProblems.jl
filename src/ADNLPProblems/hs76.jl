export hs76

function hs76(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^2 + T(0.5) * x[2]^2 + x[3]^2 + T(0.5) * x[4]^2 - x[1] * x[3] + x[3] * x[4] - x[1] -
           3 * x[2] + x[3] - x[4]
  end
  x0 = T(0.5) * ones(T, 4)
  lvar = zeros(T, 4)
  uvar = T(Inf) * ones(T, 4)
  lcon = T[1.5, -Inf, -Inf]
  ucon = T[Inf, 5, 4]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 2; 2; 2; 2; 3; 3; 3; 3],
    [2; 3; 1; 2; 3; 4; 1; 2; 3; 4],
    T[1; 4; 1; 2; 1; 1; 3; 1; 2; -1],
    lcon,
    ucon,
    name = "hs76";
    kwargs...,
  )
end
