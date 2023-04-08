export hs73

function hs73(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 2455 // 100 * x[1] + 2675 // 100 * x[2] + 39 * x[3] + 4050 // 100 * x[4]
  end
  x0 = ones(T, 4)
  lvar = zeros(T, 4)
  uvar = T(Inf) * ones(T, 4)
  function c!(cx, x)
    cx[1] = 12 * x[1] + 11.9 * x[2] + 41.8 * x[3] + 52.1 * x[4] - 21 -
    1.645 * sqrt(0.28x[1]^2 + 0.19 * x[2]^2 + 20.5 * x[3]^2 + 0.62x[4]^2)
    return cx
  end
  lcon = T[1, 5, 0]
  ucon = vcat(one(T), T(Inf), T(Inf))
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 1; 1; 2; 2; 2; 2],
    [1; 2; 3; 4; 1; 2; 3; 4],
    T[1; 1; 1; 1; 2.3; 5.6; 11.1; 1.3],
    c!,
    lcon,
    ucon,
    name = "hs73";
    kwargs...,
  )
end
