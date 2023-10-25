export linsv

function linsv(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  x0 = zeros(T, 2)
  f(x) = x[1]
  lcon = T[3; 1]
  ucon = T[Inf; Inf]

  return ADNLPModels.ADNLPModel(
    f,
    x0,
    [1; 1; 2],
    [1; 2; 2],
    T[1; 1; 1],
    lcon,
    ucon,
    name = "linsv";
    kwargs...,
  )
end
