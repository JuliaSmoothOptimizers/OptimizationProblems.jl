export hs55

function hs55(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1] + 2 * x[2] + 4 * x[5] + exp(x[1] * x[4])
  end
  x0 = T[1, 2, 0, 0, 0, 2]
  uvar = T[1, Inf, Inf, 1, Inf, Inf]
  lvar = zeros(T, 6)
  lcon = T[6, 3, 2, 1, 2, 2]
  ucon = T[6, 3, 2, 1, 2, 2]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 1; 2; 2; 2; 3; 3; 3; 4; 4; 5; 5; 6; 6],
    [1; 2; 5; 1; 2; 3; 4; 5; 6; 1; 4; 2; 5; 3; 6],
    T[1; 2; 5; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1],
    lcon,
    ucon,
    name = "hs55";
    kwargs...,
  )
end
