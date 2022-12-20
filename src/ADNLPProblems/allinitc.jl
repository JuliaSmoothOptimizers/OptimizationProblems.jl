export allinitc

function allinitc(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return x[3] - 1 + x[1]^2 + x[2]^2 + (x[3] + x[4])^2 + sin(x[3])^2 + x[1]^2 * x[2]^2 + x[4] - 3 +
           sin(x[3])^2 +
           (x[4] - 1)^2 +
           (x[2]^2)^2 +
           (x[3]^2 + (x[4] + x[1])^2)^2 +
           (x[1] - 4 + sin(x[4])^2 + x[2]^2 * x[3]^2)^2 +
           sin(x[4])^4
  end
  x0 = zeros(T, 4)
  lvar = -T(Inf) * ones(T, 4)
  uvar = T(Inf) * ones(T, 4)

  function c(x)
    return vcat(x[2] - 1, x[3], x[4] - 2, x[1]^2 + x[2]^2 - 1)
  end

  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    c,
    T[0, -1e+10, 0, -Inf],
    T[Inf, 1, 0, 0],
    name = "allinitc",
    minimize = true;
    kwargs...,
  )
end
