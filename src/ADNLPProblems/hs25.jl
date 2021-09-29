export hs25

function hs25(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  u = [25 + (-50 * log(0.01 * i))^(2 / 3) for i = 1:99]
  function f(x)
    n = length(x)
    return sum(T(-0.01 * i + exp(-1 / x[1] * (u[i] - x[2])^x[3]))^2 for i = 1:99)
  end
  x0 = T[100, 12.5, 3]
  lvar = T[0.1, 0, 0]
  uvar = T[100, 25.6, 5]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs25"; kwargs...)
end
