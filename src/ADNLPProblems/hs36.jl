export hs36

function hs36(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -x[1] * x[2] * x[3]
  end
  x0 = 10 * ones(T, 3)
  lvar = zeros(T, 3)
  uvar = T[20, 11, 42]
  function c(x)
    n = length(x)
    return [x[1] + 2 * x[2] + 2 * x[3]]
  end
  lcon = [-T(Inf)]
  ucon = T[72]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 1],
    [1; 2; 3],
    T[1; 2; 2],
    lcon,
    ucon,
    name = "hs36";
    kwargs...,
  )
end
