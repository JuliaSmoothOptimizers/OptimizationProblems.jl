export hs35

function hs35(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 9 - 8 * x[1] - 6 * x[2] - 4 * x[3] +
           2 * x[1]^2 +
           2 * x[2]^2 +
           x[3]^2 +
           2 * x[1] * x[2] +
           2 * x[1] * x[3]
  end
  x0 = T(0.5) * ones(T, 3)
  lvar = zeros(T, 3)
  uvar = T(Inf) * ones(T, 3)
  lcon = -T(Inf) * ones(T, 1)
  ucon = T[3]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 1],
    [1; 2; 3],
    T[1; 1; 2],
    lcon,
    ucon,
    name = "hs35";
    kwargs...,
  )
end
