export lincon

function lincon(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  x0 = zeros(T, 15)
  f(x) = sum(i + x[i]^4 for i = 1:15)

  clinrows = [5, 6, 5, 6, 8, 9, 10, 3, 2, 11, 11, 4, 4, 4, 7, 7, 1]
  clincols = [1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
  clinvals =
    T[1.0, 3.0, 2.0, 4.0, 9.0, 12.0, 15.0, 4.0, -2.0, 5.0, 6.0, 1.0, 2.0, 3.0, 1.0, -1.0, 15.0]

  lcon = T[22.0, -1.0, 1.0, 1.0, -5.0, -6.0, -Inf, -Inf, -Inf, -Inf, -11.0]
  ucon = T[22.0, -1.0, 1.0, Inf, Inf, Inf, 16.0, 1.0, 2.0, 3.0, 9.0]

  return ADNLPModels.ADNLPModel(
    f,
    x0,
    clinrows,
    clincols,
    clinvals,
    lcon,
    ucon,
    name = "lincon";
    kwargs...,
  )
end
