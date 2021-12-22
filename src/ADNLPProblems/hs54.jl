export hs54

function hs54(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -exp(
      -(
        (((x[1] - T(1e4))^2) / T(6.4e7) + (x[1] - T(1e4)) * (x[2] - 1) / T(2e4) + (x[2] - 1)^2) /
        T(0.96) +
        T(0.96) * ((x[3] - T(2e6))^2) / T(0.96 * 4.9e13) +
        ((x[4] - 10)^2) / T(2.5e3) +
        ((x[5] - T(1e-3))^2) / T(2.5e-3) +
        ((x[6] - T(1.e8))^2) / T(2.5e17)
      ) / 2,
    )
  end
  x0 = T[6e3, 1.5, 4e6, 2, 3e-3, 5e7]
  lvar = T[0, -10, 0, 0, -1, 0]
  uvar = T[2e4, 10, 1e7, 20, 1, 2e8]
  function c(x)
    n = length(x)
    return [x[1] + 3 * x[2]]
  end
  lcon = zeros(T, 1)
  ucon = zeros(T, 1)
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    c,
    lcon,
    ucon,
    name = "hs54",
    lin = [1];
    kwargs...,
  )
end
