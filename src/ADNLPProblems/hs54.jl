export hs54

function hs54(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -exp(
      -(
        (((x[1] - 10000)^2) / eltype(x)(6.4e7) + (x[1] - 10000) * (x[2] - 1) / 20000 + (x[2] - 1)^2) /
        96 // 100 +
        96 // 100 * ((x[3] - 2000000)^2) / (96 // 100 * eltype(x)(4.9e13)) +
        ((x[4] - 10)^2) / 2500 +
        ((x[5] - 1 // 1000)^2) / (25 // 10000) +
        ((x[6] - eltype(x)(1.e8))^2) / eltype(x)(2.5e17)
      ) / 2,
    )
  end
  x0 = T[6e3, 1.5, 4e6, 2, 3e-3, 5e7]
  lvar = T[0, -10, 0, 0, -1, 0]
  uvar = T[2e4, 10, 1e7, 20, 1, 2e8]
  lcon = zeros(T, 1)
  ucon = zeros(T, 1)
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1],
    [1; 2],
    T[1; 3],
    lcon,
    ucon,
    name = "hs54";
    kwargs...,
  )
end
