export zangwil3

function zangwil3(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return zero(eltype(x))
  end
  x0 = T[100, -1, 2.5]
  lcon = zeros(T, 3)
  ucon = zeros(T, 3)
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    [1; 1; 1; 2; 2; 2; 3; 3; 3],
    [1; 2; 3; 1; 2; 3; 1; 2; 3],
    T[1; -1; 1; -1; 1; 1; 1; 1; -1],
    lcon,
    ucon,
    name = "zangwil3";
    kwargs...,
  )
end
