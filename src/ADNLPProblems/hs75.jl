export hs75

function hs75(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  a = T(0.48)
  function f(x)
    n = length(x)
    return 3 * x[1] + 1 // 1000000 * x[1]^3 + 2 * x[2] + 1 // 1000000 * 2 // 3 * x[2]^3
  end
  x0 = zeros(T, 4)
  lvar = T[0, 0, -a, -a]
  uvar = T[1200, 1200, a, a]
  function c!(cx, x)
    cx[1] = 1000 * sin(-x[3] - 25 // 100) + 1000 * sin(-x[4] - 25 // 100) + 8948 // 10 - x[1]
    cx[2] = 1000 * sin(x[3] - 25 // 100) + 1000 * sin(x[3] - x[4] - 25 // 100) + 8948 // 10 - x[2]
    cx[3] = 1000 * sin(x[4] - 25 // 100) + 1000 * sin(x[4] - x[3] - 25 // 100) + 12948 // 10
    return cx
  end
  lcon = vcat(-a, zeros(T, 3))
  ucon = vcat(a, zeros(T, 3))
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    [1; 1],
    [4; 3],
    T[1; -1],
    c!,
    lcon,
    ucon,
    name = "hs75";
    kwargs...,
  )
end
